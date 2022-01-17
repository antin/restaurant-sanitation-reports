import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../models/meal.dart';

class About extends StatelessWidget {
  About();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      "מהי אפליקצית : יהיה בסדר או שנתראה בקבר?",
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text("מהי אפליקצית : יהיה בסדר או שנתראה בקבר?"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          'איך אזרחים יכולים להוסיף מסעדות ודוחות תברואה שלהם?'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          'איך בעלי מסעדות יכולים להוסיף מסעדות ודוחות תברואה שלהם?'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 6,
                      ),
                      Text('מי הגוף הממשלתי האחראי?'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.link_sharp,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Link(
                    uri: Uri.parse(
                        "http://archive.nytimes.com/www.nytimes.com/interactive/dining/new-york-health-department-restaurant-ratings-map.html"),
                    target: LinkTarget.blank,
                    builder: (BuildContext ctx, FollowLink? openLink) {
                      return TextButton.icon(
                        onPressed: () {
                          launch(
                              "http://archive.nytimes.com/www.nytimes.com/interactive/dining/new-york-health-department-restaurant-ratings-map.html",
                              forceWebView: true);
                        },
                        label: const Text('דוגמאות לאתרים בעולם המתוקן'),
                        icon: const Icon(Icons.read_more),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
