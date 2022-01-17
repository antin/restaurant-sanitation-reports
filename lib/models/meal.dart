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
  final String id;
  final List<String> restaurantsId;
  final String title;
  final String reportPdfUrl;
  final String sanitationStatus;
  final List<String> problems;
  final List<String> steps;
  final String reportDate;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const ReportSanitation({
    required this.id,
    required this.restaurantsId,
    required this.title,
    required this.reportPdfUrl,
    required this.sanitationStatus,
    required this.problems,
    required this.steps,
    required this.reportDate,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });
}
