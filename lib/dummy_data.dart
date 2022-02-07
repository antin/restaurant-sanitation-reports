import 'package:flutter/material.dart';

import './models/category.dart';
import './models/meal.dart';
/*
List<Restaurant> Restaurant_list = [
  Restaurant(
    id: '18638', // ms_esek_rashi
    name: 'קפה בכיכר', // t_shem_esek
    color: Colors.purple,
    city: 'תל אביב',
  ),
  Restaurant(
    id: '18744',
    name: 'סופק קליק',
    color: Colors.red,
    city: 'תל אביב',
  ),
  Restaurant(
    id: '3',
    name: 'פלאפל עובדיה',
    color: Colors.orange,
    city: 'ירושלים',
  ),
  Restaurant(
    id: '16014',
    name: 'מסעדת ארומה קריית הלאום',
    color: Colors.amber,
    city: 'ראשון לציון',
  ),
  Restaurant(
    id: '16001',
    name: 'קייטרינג סלטי משני',
    color: Colors.blue,
    city: 'ראשון לציון',
  ),
  Restaurant(
    id: '15993',
    name: 'יוחננוף מרכול',
    color: Colors.cyanAccent,
    city: 'ראשון לציון',
  ),
];

const DUMMY_MEALS = const [
  ReportSanitation(
    id: 'm2',
    restaurantsId: [
      '15993',
    ],
    title: 'Toast Hawaii',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    sanitationStatus: 'לא טובה',
    reportPdfUrl:
        'https://firebasestorage.googleapis.com/v0/b/restaurant-sanitation.appspot.com/o/%D7%93%D7%95%D7%97%20%D7%91%D7%99%D7%A7%D7%95%D7%A8%D7%AA%20(23).pdf?alt=media&token=363e90ce-a84b-4bd4-b2dd-649f17dc52bb',
    reportDate: '7/10/1996',
    problems: ['מסור מלוכלך', 'גוקים נצפו'],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  ReportSanitation(
    id: 'm3',
    restaurantsId: [
      '18744',
      'c3',
    ],
    title: 'Classic Hamburger',
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    sanitationStatus: 'טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  ReportSanitation(
    id: 'm4',
    restaurantsId: [
      'c4',
    ],
    title: 'Wiener Schnitzel',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    sanitationStatus: 'כמעט טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices'
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  ReportSanitation(
    id: 'm5',
    restaurantsId: [
      '18744'
          'c5',
      '186380',
    ],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    sanitationStatus: 'כמעט טובה',
    reportDate: '7/10/1996',
    problems: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  ReportSanitation(
    id: 'm6',
    restaurantsId: [
      'c6',
      '186380',
    ],
    title: 'Delicious Orange Mousse',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    sanitationStatus: 'כמעט טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  ReportSanitation(
    id: 'm7',
    restaurantsId: [
      'c7',
    ],
    title: 'Pancakes',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    sanitationStatus: 'כמעט טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  ReportSanitation(
    id: 'm8',
    restaurantsId: [
      'c8',
    ],
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    sanitationStatus: 'כמעט טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  ReportSanitation(
    id: 'm9',
    restaurantsId: [
      'c9',
    ],
    title: 'Chocolate Souffle',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    sanitationStatus: 'כמעט טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  ReportSanitation(
    id: 'm10',
    restaurantsId: [
      '18744',
      'c5',
      '186380',
    ],
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    sanitationStatus: 'כמעט טובה',
    reportPdfUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    reportDate: '7/10/1996',
    problems: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
*/