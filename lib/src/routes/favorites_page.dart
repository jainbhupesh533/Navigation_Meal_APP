import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavouritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text(
              'You have no favourites yet - start adding some! ',
            ),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: favoriteMeals[index].id,
                title: favoriteMeals[index].title,
                imageUrl: favoriteMeals[index].imageUrl,
                duration: favoriteMeals[index].duration,
                complexity: favoriteMeals[index].complexity,
                affordability: favoriteMeals[index].affordability,
                // removeItem: null,
              );
            },
          );
  }
}
