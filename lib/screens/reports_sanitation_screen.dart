import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:flutter_complete_guide/widgets/no_reports_sanitation_item_exist.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/reports_sanitation_item.dart';
import '../dummy_data.dart';

class ReportsSanitationScreen extends StatelessWidget {
  static const routeName = '/reports-sanitation';

  String get improveReportsSanitationUrl => "https://www.meida.org.il/?p=11611";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final restaurantTitle = routeArgs['title'];
    final restaurantId = routeArgs['id'];
    final restaurantReportsSanitationItem =
        DUMMY_MEALS.where((restaurantsIdInReportsSanitation) {
      return restaurantsIdInReportsSanitation.restaurantsId
          .contains(restaurantId);
    }).toList();
    if (restaurantReportsSanitationItem.length > 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text(restaurantTitle!),
        ),
        drawer: MainDrawer(),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return ReportsSanitationItem(
              id: restaurantReportsSanitationItem[index].id,
              title: restaurantReportsSanitationItem[index].title,
              sanitationStatus:
                  restaurantReportsSanitationItem[index].sanitationStatus,
              reportPdfUrl: restaurantReportsSanitationItem[index].reportPdfUrl,
              reportDate: restaurantReportsSanitationItem[index].reportDate,
              problems:
                  restaurantReportsSanitationItem[index].problems.toString(),
            );
          },
          itemCount: restaurantReportsSanitationItem.length,
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text(restaurantTitle!),
          ),
          drawer: MainDrawer(),
          body: NoReportsSanitationItemnExist(
              id: restaurantId as String, restaurantTitle: restaurantTitle));
    }
  }
}
