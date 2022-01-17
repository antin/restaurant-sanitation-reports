import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';

import 'package:flutter_complete_guide/providers/restaurants.dart';
import 'package:flutter_complete_guide/widgets/restaurant_item.dart';

import '../screens/reports_sanitation_screen.dart';

class RestaurantsGrid extends StatelessWidget {
  const RestaurantsGrid({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<RestaurantProvider>(context);
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],
          child: RestaurantItem(products[i].id, products[i].name,
              products[i].color, products[i].city)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
