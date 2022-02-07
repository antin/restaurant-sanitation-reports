import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class ReportSanitation {
  final String restaurantsId;
  final String reportPdfUrl;
  final String sanitationStatus;
  final String reportDate;
  /*final List<String> problems;
  final List<String> steps;  
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;*/

  const ReportSanitation({
    required this.restaurantsId,
    required this.reportPdfUrl,
    required this.sanitationStatus,
    required this.reportDate,
    /*  this.problems ,
    this.steps,
    this.complexity,
    this.affordability,
    this.isGlutenFree ,
    this.isLactoseFree,
    this.isVegan,
    this.isVegetarian,*/
  });
}
