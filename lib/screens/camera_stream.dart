import 'dart:io';

import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_shipment/data_models/piece_data_model.dart';

import '../providers/app_provider.dart';
import '../utils/barcode_detector_painter.dart';
import '../utils/ml_kit_ocr.dart';

final GlobalKey<ScaffoldState> cameraKey = GlobalKey<ScaffoldState>();
CameraController? camera;

class CameraStream extends StatefulWidget {
  CameraStream({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CameraStreamState();
}

class _CameraStreamState extends State<CameraStream> {
  // Init
  // future temporary ocr scan results
  dynamic _scanResults;
  CustomPaint? customPaint;
  late String master;
  // temporary state that allows only ocr when previous task finished
  bool _isDetecting = false;
  // specifies which type should be detected e.g ocr, barcode, face, label
  final BarcodeScanner _barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
  late String imagePath;
  late InputImageRotation rotation;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    final CameraDescription description =
        await OcrUtils.getCamera(CameraLensDirection.back);

    camera = CameraController(
      description,
      ResolutionPreset.max,
    );
    await camera!.initialize();
    await camera!.lockCaptureOrientation(DeviceOrientation.portraitUp);
    camera!.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;
      // do OCRs
      OcrUtils.detect(
        image: image,
        detectInImage: _barcodeScanner.processImage,
        imageRotation: description.sensorOrientation,
      ).then(
        (dynamic results) {
          rotation = OcrUtils.rotationIntToImageRotation(
              description.sensorOrientation);
          if (mounted) {
            setState(() {
              _scanResults = results;
            });
          }
        },
      ).whenComplete(() {
        _isDetecting = false;
      });
    });
  }

  Widget _buildResults() {
    const Text noResultsText = Text('No results!');

    if (_scanResults == null ||
        camera == null ||
        !camera!.value.isInitialized) {
      return noResultsText;
    }
    CustomPainter painter;
    painter = BarcodeDetectorPainter(
        _scanResults, camera!.value.previewSize!, rotation);

    for (Barcode bc in _scanResults) {
      if (bc.type == BarcodeType.url) {
        PieceModel pm = PieceModel(
          id: "1",
          type: "1",
          httpsOnerecordIataOrgCargoPieceCompanyIdentifier: "1",
          httpsOnerecordIataOrgCargoPieceShipper:
              HttpsOnerecordIataOrgCargoPieceShipper(id: "1", type: "1"),
          httpsOnerecordIataOrgCargoPieceCoload: true,
          httpsOnerecordIataOrgCargoPieceDeclaredValueForCustoms: "1",
          httpsOnerecordIataOrgCargoPieceGoodsDescription: "1",
          httpsOnerecordIataOrgCargoPieceGrossWeight: "1",
          httpsOnerecordIataOrgCargoPieceNvdForCarriage: true,
          httpsOnerecordIataOrgCargoPieceNvdForCustoms: true,
          httpsOnerecordIataOrgCargoPiecePackagedeIdentifier: "1",
          httpsOnerecordIataOrgCargoPieceShippingMarks: "1",
          httpsOnerecordIataOrgCargoPieceSlac: 1,
          httpsOnerecordIataOrgCargoPieceStackable: true,
          httpsOnerecordIataOrgCargoPieceTurnable: true,
          httpsOnerecordIataOrgCargoPieceUpid: "1",
        );

        Provider.of<AppProvider>(context).addPieceToList(pm);
        //void pauseAWhile;

        closeCameraAndStream();

        // Navigator.pop(context);

        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Navigator.popAndPushNamed(context, '/piece');

          Navigator.pop(context);
        });
      }
    }

    return CustomPaint(
      painter: painter,
    );
  }

  void pauseAWhile() async {
    await Future.delayed(const Duration(seconds: 2), () {});
  }

  Widget _buildImage() {
    final size = MediaQuery.of(context).size;
    //todo solve null check on a null value at this point
    double scale =
        camera != null ? size.aspectRatio * camera!.value.aspectRatio : 1;
    if (scale < 1) scale = 1 / scale;

    return Container(
      constraints: const BoxConstraints.expand(),
      child: camera == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Transform.scale(
                  scale: scale ?? 1,
                  child: Center(child: CameraPreview(camera!)),
                ),
                _buildResults(),
              ],
            ),
    );
  }

  Widget _mainContainer() {
    return Stack(
      children: [
        Center(
          child: _buildImage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //master = Provider.of<MasterAirwayBillProvider>(context).getMaster();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: true,
        backgroundColor:
            CupertinoTheme.of(context).barBackgroundColor.withOpacity(0.6),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
      child: _mainContainer(),
    );
  }

  void showInSnackBar(String message) {
    //TODO maybe implement a better snackbar
    // ignore: deprecated_member_use
    //_scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  void _showCameraException(CameraException e) {
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  Future<bool> onBackPressed() {
    closeCameraAndStream();
    //Navigator.popAndPushNamed(context, "camera_stream");

    // Navigator.of(context).popAndPushNamed("camera_stream").then((value) {
    //   _initializeCamera();
    // });
    Navigator.pop(context);

    return Future.value(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void closeCameraAndStream() async {
    if (camera!.value.isStreamingImages) {
      await camera!.stopImageStream();
    }
    await _barcodeScanner.close();
    await camera!.dispose();
    setState(() {
      camera = null;
      _scanResults = null;
    });
  }
}

void giveHapticFeedback() {
  SystemSound.play(SystemSoundType.click);
  HapticFeedback.lightImpact();
}
