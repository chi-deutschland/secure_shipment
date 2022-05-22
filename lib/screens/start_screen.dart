import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_shipment/screens/camera_stream.dart';
import 'package:secure_shipment/screens/regulated_entities.dart';
import 'package:secure_shipment/widgets/add_icon.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';
import 'package:animated_button/animated_button.dart';

import '../widgets/securing_process_details_card.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        elevation: 35,
        backgroundColor: primaryGradientColor,
        title: const Text(
          "Securing Process",
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
          SecuringProcessDetailsCard(
            weight: "10 kg",
            desc: "MBP",
          ),
          const SizedBox(
            height: 10,
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
