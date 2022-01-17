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

class NoReportsSanitationItemnExist extends StatelessWidget {
  final String id;
  final String restaurantTitle;

  NoReportsSanitationItemnExist({
    required this.id,
    required this.restaurantTitle,
  });

  String get improveReportsSanitationUrl => "https://www.meida.org.il/?p=11611";

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
                      restaurantTitle,
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
                      Text(
                          'המקום "$restaurantTitle" לא פרסם ביקורת, אז או שיהיה בסדר או שנתראה בקבר'),
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
                      Text('מוזמן לפנות אליו להציע לו לפרסם ביקורת'),
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
                          'מוזמן לתרום לנו לקידום הנושא, מצ"ב סטטוס המאבק בנושא'),
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
                          'מוזמן להירשם למעקב אחרי המאבק בנושא ונעדכן אותך אם יהיה חדש'),
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
                    uri: Uri.parse(improveReportsSanitationUrl),
                    target: LinkTarget.blank,
                    builder: (BuildContext ctx, FollowLink? openLink) {
                      return TextButton.icon(
                        onPressed: openLink,
                        label: const Text('קישור לשינוי המצב'),
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
