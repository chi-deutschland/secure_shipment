import 'package:animated_button/animated_button.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';

class SecuringScreen extends StatelessWidget {
  const SecuringScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: Text('Branch',
                              style: TextStyle(
                                  fontSize: smallText,
                                  //color: redColor,
                                  fontFamily: sfproregular)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 35, 20, 10),
                  child: AwesomeDropDown(
                    dropDownList: ["Abc", "DEF", "GHI", "JKL", "MNO", "PQR"],
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
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 35, 20, 10),
                  child: AwesomeDropDown(
                    dropDownList: ["Abc", "DEF", "GHI", "JKL", "MNO", "PQR"],
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
                    'XYZ',
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
                  Navigator.popUntil(context, ModalRoute.withName('/status'));
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
