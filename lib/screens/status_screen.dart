import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_shipment/config/colors.dart';
import 'package:secure_shipment/screens/start_screen.dart';
import 'package:secure_shipment/widgets/piece_details_card.dart';

import '../config/dimens.dart';
import '../config/fonts.dart';
import 'package:animated_button/animated_button.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

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
          "Ongoing security processes",
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
          PieceDetailsCard(),
          const SizedBox(
            height: 30,
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
                      builder: (context) => const StartScreen(),
                    ),
                  );
                },
                shadowDegree: ShadowDegree.dark,
                color: primaryGradientColor,
                child: const Text(
                  'New Piece',
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
