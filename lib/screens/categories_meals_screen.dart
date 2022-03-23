import 'package:flutter/material.dart';
import 'package:receitas/components/meal_item.dart';
import '../models/category.dart';
import '../models/meal.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen(this.meals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final List<Meal> categoryMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: Center(
          child: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) {
          return MealItem(categoryMeals[index]);
        },
      )),
    );
  }
}
