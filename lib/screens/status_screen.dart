import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:secure_shipment/config/colors.dart';
import 'package:secure_shipment/screens/start_screen.dart';

import '../config/dimens.dart';
import '../config/fonts.dart';
import 'package:animated_button/animated_button.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Card(),
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
