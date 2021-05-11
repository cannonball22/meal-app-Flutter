import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavouriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Container(
        child: Text('You have no favorite yet - start adding some!'),
      );
    } else {
      return ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          affordability: favoriteMeals[index].affordability,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          imageUrl: favoriteMeals[index].imageUrl,
        );
      });
    }
  }
}
