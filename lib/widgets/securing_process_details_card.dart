import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../config/dimens.dart';
import '../config/fonts.dart';
import '../providers/app_provider.dart';

class SecuringProcessDetailsCard extends StatefulWidget {
  //final String customs;
  final String desc;
  final String weight;
  //final String id;

  const SecuringProcessDetailsCard({
    Key? key,
    //required this.customs,
    required this.desc,
    required this.weight,
    //required this.id,
  }) : super(key: key);

  @override
  _SecuringProcessDetailsCardState createState() =>
      _SecuringProcessDetailsCardState();
}

class _SecuringProcessDetailsCardState
    extends State<SecuringProcessDetailsCard> {
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
    return FutureBuilder(
      future: Provider.of<AppProvider>(context).getPieceList(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length > 0) {
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
                                    'Weight',
                                    style: TextStyle(
                                        fontSize: smallestText,
                                        color: blackColor,
                                        fontFamily: sfproregular),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  widget.weight,
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
                                  CupertinoIcons.collections,
                                  color: blackColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.0),
                                  child: Text('Content',
                                      style: TextStyle(
                                          fontSize: smallestText,
                                          color: blackColor,
                                          fontFamily: sfproregular)),
                                ),
                                Spacer(),
                                Text(
                                  widget.desc,
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
                                  CupertinoIcons.location,
                                  color: blackColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.0),
                                  child: Text('Origin',
                                      style: TextStyle(
                                          fontSize: smallestText,
                                          color: blackColor,
                                          fontFamily: sfproregular)),
                                ),
                                Spacer(),
                                Text(
                                  'FRA',
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
                                  CupertinoIcons.location_solid,
                                  color: blackColor,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2.0),
                                  child: Text('Destination',
                                      style: TextStyle(
                                          fontSize: smallestText,
                                          color: blackColor,
                                          fontFamily: sfproregular)),
                                ),
                                Spacer(),
                                Text(
                                  'CGN',
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
                  )

                  // ListView.builder(
                  //   itemCount: snapshot.data.length,
                  //   itemBuilder: (context, int index) {
                  //     return Text("1");
                  //   },
                  // )
                ],
              ),
            );
          } else {
            return Center(
                child: Text("No Shipments being processed right now"));
          }
        } else {
          return Center(child: Text("No Shipments being processed right now"));
        }
      },
    );
  }
}
