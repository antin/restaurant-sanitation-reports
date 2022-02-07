import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:flutter_complete_guide/widgets/no_reports_sanitation_item_exist.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/restaurants.dart';

import '../widgets/reports_sanitation_item.dart';
import '../dummy_data.dart';

class ReportsSanitationScreen extends StatefulWidget {
  static const routeName = '/reports-sanitation';

  List<ReportSanitation> ReportSanitation_list = [];

  String get improveReportsSanitationUrl => "https://www.meida.org.il/?p=11611";

  @override
  _ReportsSanitationScreenState createState() =>
      _ReportsSanitationScreenState();
}

class _ReportsSanitationScreenState extends State<ReportsSanitationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //late SearchBar searchBar;

  List<ReportSanitation> ReportSanitation_list = [];

  var _isInit = true;
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final restaurantTitle = routeArgs['title'];
    final restaurantId = routeArgs['id'];
    print('build->restaurantId: ${restaurantId}.');
    print(
        'build->ReportSanitation_list.length: ${ReportSanitation_list.length}.');
/*
    if (ReportSanitation_list.length == 0) {
      print(
          'build-2->ReportSanitation_list.length-b: ${ReportSanitation_list.length}.');
      Provider.of<RestaurantProvider>(context)
          .fetchAndSetRestaurants()
          .then((_) {
        final productsData = Provider.of<RestaurantProvider>(context);
        ReportSanitation_list = productsData.reportSanitationItems;
        print(
            'build-2->ReportSanitation_list.length-a: ${ReportSanitation_list.length}.');
      });
      print(
          'build-3->ReportSanitation_list.length-b: ${ReportSanitation_list.length}.');
      final productsData = Provider.of<RestaurantProvider>(context);
      ReportSanitation_list = productsData.reportSanitationItems;
      print(
          'build-3->ReportSanitation_list.length-a: ${ReportSanitation_list.length}.');
    }
    */

    final restaurantReportsSanitationItem =
        ReportSanitation_list.where((restaurantsIdInReportsSanitation) {
      return restaurantsIdInReportsSanitation.restaurantsId != '' &&
          restaurantsIdInReportsSanitation.restaurantsId == restaurantId;
    }).toList();

    if (restaurantReportsSanitationItem.length > 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text(restaurantTitle!),
        ),
        drawer: MainDrawer(),
/*        body: ListView(          
        children: ReportSanitation_list.map(
            (reportSanitationData) => ReportSanitation(
                reportSanitationData.restaurantsId,
                reportSanitationData.reportPdfUrl,
                reportSanitationData.sanitationStatus,
                reportSanitationData.reportDate),
          ).toList(),*/
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return ReportsSanitationItem(
              restaurantsId:
                  restaurantReportsSanitationItem[index].restaurantsId,
              sanitationStatus:
                  restaurantReportsSanitationItem[index].sanitationStatus,
              reportPdfUrl: restaurantReportsSanitationItem[index].reportPdfUrl,
              reportDate: restaurantReportsSanitationItem[index].reportDate,
              //problems:
              //  restaurantReportsSanitationItem[index].problems.toString(),
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

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<RestaurantProvider>(context)
          .fetchAndSetRestaurants()
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      if (ReportSanitation_list.length == 0) {
        final productsData = Provider.of<RestaurantProvider>(context);
        ReportSanitation_list = productsData.reportSanitationItems;
        print(
            'didChangeDependencies-1->ReportSanitation_list.length: ${ReportSanitation_list.length}.');
      }
    }
    _isInit = false;

    if (ReportSanitation_list.length == 0) {
      final productsData = Provider.of<RestaurantProvider>(context);
      ReportSanitation_list = productsData.reportSanitationItems;
      print(
          'didChangeDependencies-2->ReportSanitation_list.length: ${ReportSanitation_list.length}.');
    }

    super.didChangeDependencies();
  }
}
