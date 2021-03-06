import 'package:flutter/material.dart';
import 'package:receitas/data/dummy_data.dart';
import 'package:receitas/models/meal.dart';
import 'package:receitas/models/settings.dart';
import 'package:receitas/screens/categories_meals_screen.dart';
import 'package:receitas/screens/meal_detail_screen.dart';
import 'package:receitas/screens/settings_screen.dart';
import 'package:receitas/screens/tabs_screen.dart';
import 'package:receitas/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings newSettings) {
    setState(() {
      settings = newSettings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = newSettings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = newSettings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = newSettings.isVegan && !meal.isVegan;
        final filterVegetarian = newSettings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas',
      theme: ThemeData().copyWith(
        primaryColor: Colors.pink,
        canvasColor: const Color.fromARGB(255, 253, 251, 179),
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.pink,
              secondary: Colors.amber,
            ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  color: Colors.black),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (context) => SettingsScreen(settings, _filterMeals),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
