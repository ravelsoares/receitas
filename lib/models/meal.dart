import 'package:receitas/models/category.dart';

enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String id;
  final String title;
  final List<String> categories;
  final List<String> ingredients;
  final String imageUrl;
  final List<String> steps;
  final int duration;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.title,
    required this.categories,
    required this.ingredients,
    required this.imageUrl,
    required this.steps,
    required this.duration,
    required this.isLactoseFree,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.complexity,
    required this.cost,
  });
}
