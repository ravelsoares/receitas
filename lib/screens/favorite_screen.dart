import 'package:flutter/material.dart';
import 'package:receitas/components/meal_item.dart';

import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Nenhuma receita foi marcada como favorito'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
