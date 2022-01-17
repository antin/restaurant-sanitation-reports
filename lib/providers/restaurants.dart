import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/category.dart';
import 'package:http/http.dart' as http;

//import './product.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];
  // var _showFavoritesOnly = false;

  List<Restaurant> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
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
        extractedData.forEach((prodData) {
          if (prodData['restaurant_details']['id'] != null &&
              int.tryParse(prodData['restaurant_details']['id'].toString()) !=
                  null &&
              prodData['restaurant_details']['name'] != null &&
              prodData['restaurant_details']['name'] != '' &&
              prodData['restaurant_details']['category'] == 'מזון')
            loadedRestaurants.add(Restaurant(
              id: prodData['restaurant_details']['id'].toString(),
              name: prodData['restaurant_details']['name'],
              city: prodData['restaurant_details']['city'],
            ));
          //else
          //print('prodData: ${prodData.toString()}');
        });
        _items = loadedRestaurants;
        print('_items.length: ${_items.length}.');
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
