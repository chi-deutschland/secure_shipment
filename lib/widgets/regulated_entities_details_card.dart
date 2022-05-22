import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';

class RegulatedEntitiesDetailsCard extends StatefulWidget {
  const RegulatedEntitiesDetailsCard({Key? key}) : super(key: key);

  @override
  State<RegulatedEntitiesDetailsCard> createState() =>
      _RegulatedEntitiesDetailsCardState();
}

class _RegulatedEntitiesDetailsCardState
    extends State<RegulatedEntitiesDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 20, left: 20, top: 5),
      decoration: BoxDecoration(
        borderRadius: borderRadiusCard,
        boxShadow: [
          boxShadowCard,
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Text('Regulated entitiy category',
                              style: TextStyle(
                                  fontSize: smallestText,
                                  color: blackColor,
                                  fontFamily: sfproregular)),
                        ),
                        Spacer(),
                        Text(
                          'RA',
                          style: TextStyle(
                              fontSize: smallestText,
                              color: blackColor,
                              fontFamily: sfproregular),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Text('Regulated entity ID',
                              style: TextStyle(
                                  fontSize: smallestText,
                                  color: blackColor,
                                  fontFamily: sfproregular)),
                        ),
                        Spacer(),
                        Text(
                          '002-02200',
                          style: TextStyle(
                              fontSize: smallestText,
                              color: blackColor,
                              fontFamily: sfproregular),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
