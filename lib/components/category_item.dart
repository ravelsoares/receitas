import 'package:flutter/material.dart';
import 'package:receitas/models/category.dart';
import 'package:receitas/screens/categories_meals_screen.dart';
import 'package:receitas/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem(this.category, {Key? key}) : super(key: key);

  void _selectedCategory(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.CATEGORIES_MEALS, arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).colorScheme.secondary,
      onTap: () => _selectedCategory(context),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.5),
              category.color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
