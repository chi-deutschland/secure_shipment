import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_shipment/screens/camera_stream.dart';
import 'package:secure_shipment/screens/regulated_entities.dart';
import 'package:secure_shipment/widgets/add_icon.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';
import 'package:animated_button/animated_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 20, left: 20, top: 5),
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
                          Icon(CupertinoIcons.wifi_slash, color: redColor),
                          Padding(
                            padding: EdgeInsets.only(left: 3.0),
                            child: Text('Status',
                                style: TextStyle(
                                    fontSize: smallText,
                                    color: redColor,
                                    fontFamily: sfproregular)),
                          ),
                        ],
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 35, 20, 10),
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
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraStream(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 20, left: 20, top: 5),
              decoration: BoxDecoration(
                borderRadius: borderRadiusCard,
                boxShadow: [
                  boxShadowCard,
                ],
                color: Colors.white54,
              ),
              child: const AddIconWidget(),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: AnimatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegulatedEntitiesScreen(),
                    ),
                  );
                },
                shadowDegree: ShadowDegree.dark,
                color: primaryGradientColor,
                child: const Text(
                  'Start',
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
