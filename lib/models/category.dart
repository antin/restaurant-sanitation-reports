import 'package:flutter/material.dart';

class Restaurant with ChangeNotifier {
  final String id;
  final String name;
  final Color color;
  final String city;

  Restaurant({
    required this.id,
    required this.name,
    this.color = Colors.orange,
    required this.city,
  });
}
