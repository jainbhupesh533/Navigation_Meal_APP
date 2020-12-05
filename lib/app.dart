import 'package:flutter/material.dart';
import './src/routes/filter_page.dart';
import './src/routes/tabs_page.dart';
import './src/routes/meal_detail.dart';
import './src/routes/category_meals_screen.dart';
import './src/routes/categories_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndianChops',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(),
      },
      // ? generation of random route
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder:(ctx)=> CategoriesScreen(),);
      // },
      // * when route forget his path 
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (ctx) => CategoriesScreen(),
      ),
    );
  }
}
