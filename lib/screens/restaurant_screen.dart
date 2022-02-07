import 'package:flutter_complete_guide/models/category.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';
import 'package:provider/provider.dart';

import '../dummy_data.dart';
import '../widgets/restaurant_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import '../models/meal.dart';
import '../providers/restaurants.dart';

//https://dev.to/nicks101/when-to-use-setstate-in-flutter-380

class RestaurantScreen extends StatefulWidget {
  static const routeName = '/restaurants';

  @override
  _SearchBarRestaurantScreenState createState() =>
      _SearchBarRestaurantScreenState();
}

class _SearchBarRestaurantScreenState extends State<RestaurantScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  late SearchBar searchBar;

  List<Restaurant> Restaurant_list_grid = [];

  var _isInit = true;
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    print(
        'build->Restaurant_list_grid.length: ${Restaurant_list_grid.length}.');

    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      drawer: MainDrawer(),
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: Restaurant_list_grid.map(
          (restaurantData) => RestaurantItem(restaurantData.id,
              restaurantData.name, restaurantData.color, restaurantData.city),
        ).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('חיפוש לפי שם מסעדה או לפי עיר'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    setState(() {
      var context = _scaffoldKey.currentContext;

      if (context == null) {
        return;
      }

      var tmpRestaurantListGrid = Restaurant_list_grid;

      Restaurant_list_grid = tmpRestaurantListGrid
          .where((r) =>
              value.isNotEmpty &&
              (r.city.contains(value) || r.name.contains(value)))
          .toList();
      print('tmpRestaurantListGrid.length: ${tmpRestaurantListGrid.length}.');
      print(
          'onSubmitted->Restaurant_list_grid.length: ${Restaurant_list_grid.length}.');
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
          new SnackBar(content: new Text('You wrote "$value"!')));
    });
  }

  _SearchBarRestaurantScreenState() {
    searchBar = new SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("Search bar has been cleared");
        },
        onClosed: () {
          print("Search bar has been closed");
        });
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
      if (Restaurant_list_grid.length == 0) {
        final productsData = Provider.of<RestaurantProvider>(context);
        Restaurant_list_grid = productsData.items;
        print(
            'didChangeDependencies-1->Restaurant_list_grid.length: ${Restaurant_list_grid.length}.');
      }
    }
    _isInit = false;

    if (Restaurant_list_grid.length == 0) {
      final productsData = Provider.of<RestaurantProvider>(context);
      Restaurant_list_grid = productsData.items;
      print(
          'didChangeDependencies-2->Restaurant_list_grid.length: ${Restaurant_list_grid.length}.');
    }

    super.didChangeDependencies();
  }
}
