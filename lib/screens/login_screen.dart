import 'dart:async';

import 'package:secure_shipment/screens/status_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../utils/fade_in.dart';
import 'package:pinput/pinput.dart';
import 'package:animated_button/animated_button.dart';

final TextEditingController _pinPutController = TextEditingController();
final FocusNode _pinPutFocusNode = FocusNode();
bool animActive = false;
bool _showFirst = false;
Timer? _timer;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///hides android status bar at top
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);

    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(
        builder: (context) {
          return Stack(children: [
            Align(child: BackgroundVideo()),
            AnimatedPositioned(
              duration: Duration(milliseconds: 250),
              child: Align(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _PinInputContainer(),
                        const SizedBox(height: 30.0),
                        LoginButton(),
                        const SizedBox(height: 50.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }

// @override
// void dispose() {
//   super.dispose();
// }
}

class BackgroundVideo extends StatefulWidget {
  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset("assets/login.mp4");
    _controller.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized.
      setState(() {});
      // Once the video has been loaded we play the video and set looping to true.
      _controller.play();
      _controller.setLooping(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FittedBox(
        // If your background video doesn't look right, try changing the BoxFit property.
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _controller.dispose();
  }
}

/// container widget containing pin input widget
class _PinInputContainer extends StatelessWidget {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  // final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  //   borderRadius: BorderRadius.circular(8),
  // );

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      2.5,
      Container(
        color: transparentContainerColor,
        margin: const EdgeInsets.all(20.0),
        padding: const EdgeInsets.all(10.0),
        child: Pinput(
          key: Key('_PinInputContainer'),
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: defaultPinTheme.copyDecorationWith(
            border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
            borderRadius: BorderRadius.circular(8),
          ),
          focusNode: _pinPutFocusNode,
          controller: _pinPutController,
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  void initState() {
    super.initState();
    // starts animating just after the first frame
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() => _showFirst = !_showFirst),
    );
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() => _showFirst = !_showFirst),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      3,
      AnimatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StatusScreen(),
            ),
          );
        },
        shadowDegree: ShadowDegree.dark,
        color: primaryGradientColor,
        child: const Text(
          'Login',
          style: TextStyle(
              fontSize: biggestText,
              color: secondaryTextColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.9),
        ),
      ),
    );
  }
}
