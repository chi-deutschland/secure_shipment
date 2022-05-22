import 'package:flutter/material.dart';
import 'package:secure_shipment/screens/securing_screen.dart';
import 'package:secure_shipment/widgets/regulated_entities_details_card.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';
import '../widgets/add_icon.dart';

class RegulatedEntitiesScreen extends StatelessWidget {
  const RegulatedEntitiesScreen({Key? key}) : super(key: key);

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
          "Regulated Entities",
          style: TextStyle(
              fontSize: biggerText,
              color: secondaryTextColor,
              fontFamily: sfprobold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          RegulatedEntitiesDetailsCard(),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecuringScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 20, left: 20, top: 5),
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
        ],
      ),
    );
  }
}
