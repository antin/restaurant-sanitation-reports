import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/category.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:http/http.dart' as http;

//import './product.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _items = [];
  List<ReportSanitation> _reportSanitationItems = [];

  List<Restaurant> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<ReportSanitation> get reportSanitationItems {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._reportSanitationItems];
  }

/*
  List<Restaurant> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }
*/
  Restaurant findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  Future<void> fetchAndSetRestaurants() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.https(
        'restaurant-sanitation-2a8da-default-rtdb.europe-west1.firebasedatabase.app',
        '/restaurant.json',
        {'q': '{http}'});

    //const url =
    //    'https://restaurant-sanitation-2a8da-default-rtdb.europe-west1.firebasedatabase.app/restaurant.json';
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final extractedData = json.decode(response.body)
            as List<dynamic>; // Map<String, dynamic>;
        final List<Restaurant> loadedRestaurants = [];
        final List<ReportSanitation> loadedReportSanitations = [];

        extractedData.forEach((prodData) {
          if (prodData['restaurant_details'] != null &&
              prodData['restaurant_details']['id'] != null &&
              int.tryParse(prodData['restaurant_details']['id'].toString()) !=
                  null &&
              prodData['restaurant_details']['name'] != null &&
              prodData['restaurant_details']['name'] != '' &&
              prodData['restaurant_details']['category'] == 'מזון') {
            loadedRestaurants.add(Restaurant(
              id: prodData['restaurant_details']['id'].toString(),
              name: prodData['restaurant_details']['name'],
              city: prodData['restaurant_details']['city'],
            ));
            var strProdData = prodData['restaurant_details']
                .containsKey('restaurant_sanitation');
            if (strProdData) {
              print('strProdData-2->: ${strProdData}.');
              loadedReportSanitations.add(ReportSanitation(
                restaurantsId: prodData['restaurant_details']
                        ['restaurant_sanitation']['restaurantsId']
                    .toString(),
                reportPdfUrl: prodData['restaurant_details']
                    ['restaurant_sanitation']['reportPdfUrl'],
                sanitationStatus: prodData['restaurant_details']
                    ['restaurant_sanitation']['sanitationStatus'],
                reportDate: prodData['restaurant_details']
                    ['restaurant_sanitation']['reportDate'],
              ));
            }
          }
          /*else if (prodData['restaurant_sanitation'] != null &&
              prodData['restaurant_sanitation']['restaurantsId'] != null &&
              BigInt.tryParse(prodData['restaurant_sanitation']['restaurantsId']
                      .toString()) !=
                  null &&
              prodData['restaurant_sanitation']['reportPdfUrl'] != null &&
              prodData['restaurant_sanitation']['reportPdfUrl'] != '' &&
              prodData['restaurant_sanitation']['reportDate'] != null &&
              prodData['restaurant_sanitation']['reportDate'] != '')
            loadedReportSanitations.add(ReportSanitation(
              restaurantsId: prodData['restaurant_sanitation']['restaurantsId'],
              reportPdfUrl: prodData['restaurant_sanitation']['reportPdfUrl'],
              reportDate: prodData['restaurant_sanitation']['reportDate'],
              sanitationStatus: prodData['restaurant_sanitation']
                  ['sanitationStatus'],
            ));
            */
        });
        _items = loadedRestaurants;
        print('fetchAndSetRestaurants->_items.length: ${_items.length}.');
        _reportSanitationItems = loadedReportSanitations;
        print(
            'fetchAndSetRestaurants->_reportSanitationItems.length: ${_reportSanitationItems.length}.');

        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      throw (error);
    }

/*
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    */
  }

/*
  Future<void> addProduct(Restaurant product) async {
    const url = 'https://flutter-update.firebaseio.com/Restaurants.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'isFavorite': product.isFavorite,
        }),
      );
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }
  */

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
