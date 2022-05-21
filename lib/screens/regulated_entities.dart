import 'package:flutter/material.dart';
import 'package:secure_shipment/screens/securing_screen.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';
import '../widgets/add_icon.dart';

class RegulatedEntitiesScreen extends StatelessWidget {
  const RegulatedEntitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
