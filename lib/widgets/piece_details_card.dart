import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';

class PieceDetailsCard extends StatefulWidget {
  const PieceDetailsCard({Key? key}) : super(key: key);

  @override
  _PieceDetailsCardState createState() => _PieceDetailsCardState();
}

class _PieceDetailsCardState extends State<PieceDetailsCard> {
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
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/mbp.png'),
                    alignment: Alignment(1.0, 1.0)),
                borderRadius: BorderRadius.only(
                    topLeft: radiusCard, topRight: radiusCard),
              ),
            ),
          ),
          Divider(),
          Container(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.cube_box_fill,
                          color: blackColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Text(
                            'BRANCH',
                            style: TextStyle(
                                fontSize: smallestText,
                                color: blackColor,
                                fontFamily: sfproregular),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Security.inc/FRA',
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
                        Icon(
                          CupertinoIcons.number,
                          color: blackColor,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.0),
                          child: Text('Regulated Agent ID',
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
