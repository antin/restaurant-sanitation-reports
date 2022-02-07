import 'package:flutter/material.dart';

import '../screens/reports_sanitation_screen.dart';

class RestaurantItem extends StatelessWidget {
  final String id;
  final String title;
  final String city;
  /*final String sanitationStatus;
  final String reportPdfUrl;
  final String reportDate;*/
  final Color color;

  RestaurantItem(this.id, this.title, this.color, this.city);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ReportsSanitationScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
        /*'sanitationStatus': sanitationStatus,
        'reportPdfUrl': reportPdfUrl,
        'reportDate': reportDate,*/
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title + ' ב' + city,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
