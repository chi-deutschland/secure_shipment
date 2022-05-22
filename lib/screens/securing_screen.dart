import 'dart:io';

import 'package:animated_button/animated_button.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:secure_shipment/screens/pdf_preview_screen.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class SecuringScreen extends StatelessWidget {
  SecuringScreen({Key? key}) : super(key: key);
  final pdf = pw.Document();

  writeOnPdf() {
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a5,
      margin: pw.EdgeInsets.all(32),
      build: (pw.Context context) {
        return <pw.Widget>[
          pw.Header(
            level: 5,
            child: pw.Text("Consignment Security declaration"),
          ),
          pw.Divider(),
          pw.Table.fromTextArray(
            context: context,
            data: const <List<String>>[
              <String>[
                'Regulated Agent Identifier',
                'Unique Consignment Identifier'
              ],
              <String>['          002-02200 ', ' 12345           '],
            ],
          ),

          pw.Header(
              level: 1, child: pw.Text("Additional Security Declaration")),

          pw.Table.fromTextArray(
            context: context,
            data: const <List<String>>[
              <String>[
                'Received from',
                'Screening method',
                'Grounds for exemption'
              ],
              <String>['CHI Cargo', 'XRY', 'None'],
            ],
          ),

          pw.Table.fromTextArray(
            context: context,
            data: const <List<String>>[
              <String>[
                'Security status issued by',
                'Security status issued on'
              ],
              <String>['Oliver Meschkov', '22.05.2022'],
            ],
          ),

          pw.Header(level: 1, child: pw.Text("Security Status")),
          pw.Paragraph(text: "Secure"),

          pw.Header(
              level: 1,
              child: pw.Text("Specify other sreening method (If applicable)")),
          // pw.Paragraph(
          //     text:
          //         "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."),
        ];
      },
    ));
  }

  Future savePdf() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    file.writeAsBytesSync(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 25,
        backgroundColor: redColor,
        onPressed: () async {
          writeOnPdf();
          await savePdf();

          Directory documentDirectory =
              await getApplicationDocumentsDirectory();

          String documentPath = documentDirectory.path;

          String fullPath = "$documentPath/example.pdf";

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PdfPreviewScreen(
                        path: fullPath,
                      )));
        },
        child: Icon(Icons.picture_as_pdf_rounded),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 35,
        backgroundColor: primaryGradientColor,
        title: const Text(
          "Securities",
          style: TextStyle(
              fontSize: biggerText,
              color: secondaryTextColor,
              fontFamily: sfprobold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
            decoration: BoxDecoration(
              borderRadius: borderRadiusCard,
              boxShadow: [
                boxShadowCard,
              ],
              color: Colors.white54,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Text(
                            'Security Methods',
                            style: TextStyle(
                                fontSize: smallText,
                                //color: redColor,
                                fontFamily: sfproregular),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 35, 20, 10),
                  child: AwesomeDropDown(
                    dropDownList: ["XRY", "EDS", "VCK", "PHS"],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
            decoration: BoxDecoration(
              borderRadius: borderRadiusCard,
              boxShadow: [
                boxShadowCard,
              ],
              color: Colors.white54,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Text('Branch',
                                style: TextStyle(
                                    fontSize: smallText,
                                    //color: redColor,
                                    fontFamily: sfproregular)),
                          ),
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 20, 10),
                  child: Text(
                    'security.inc/FRA',
                    style: TextStyle(
                        fontSize: smallText,
                        color: grayOpacityTextColor,
                        fontFamily: sfproregular),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
            decoration: BoxDecoration(
              borderRadius: borderRadiusCard,
              boxShadow: [
                boxShadowCard,
              ],
              color: Colors.white54,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Text('Regulated entity catergory',
                                style: TextStyle(
                                    fontSize: smallText,
                                    //color: redColor,
                                    fontFamily: sfproregular)),
                          ),
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 20, 10),
                  child: Text(
                    'RA',
                    style: TextStyle(
                        fontSize: smallText,
                        color: grayOpacityTextColor,
                        fontFamily: sfproregular),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
            decoration: BoxDecoration(
              borderRadius: borderRadiusCard,
              boxShadow: [
                boxShadowCard,
              ],
              color: Colors.white54,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Text('Regulated entity identifier',
                                style: TextStyle(
                                    fontSize: smallText,
                                    //color: redColor,
                                    fontFamily: sfproregular)),
                          ),
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 20, 10),
                  child: Text(
                    '002-02200',
                    style: TextStyle(
                        fontSize: smallText,
                        color: grayOpacityTextColor,
                        fontFamily: sfproregular),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
            decoration: BoxDecoration(
              borderRadius: borderRadiusCard,
              boxShadow: [
                boxShadowCard,
              ],
              color: Colors.white54,
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Text('Expiry date',
                                style: TextStyle(
                                    fontSize: smallText,
                                    //color: redColor,
                                    fontFamily: sfproregular)),
                          ),
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 45, 20, 10),
                  child: Text(
                    '25.05.2022',
                    style: TextStyle(
                        fontSize: smallText,
                        color: grayOpacityTextColor,
                        fontFamily: sfproregular),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AnimatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                shadowDegree: ShadowDegree.dark,
                color: primaryGradientColor,
                child: const Text(
                  'Finish',
                  style: TextStyle(
                      fontSize: biggestText,
                      fontFamily: sfprobold,
                      color: secondaryTextColor,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.none,
                      letterSpacing: 0.9),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
