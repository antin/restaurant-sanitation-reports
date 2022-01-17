import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/reports_sanitation_screen.dart';
import './screens/restaurant_screen.dart';
import 'providers/restaurants.dart';
import 'screens/about_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants',
      theme: ThemeData(
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/', // default is '/'
      routes: {
        '/': (ctx) => RestaurantScreen(),
        RestaurantScreen.routeName: (ctx) => RestaurantScreen(),
        ReportsSanitationScreen.routeName: (ctx) => ReportsSanitationScreen(),
        AboutScreen.routeName: (ctx) => AboutScreen(),
      },
    );
  }
}
