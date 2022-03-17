import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Category category;
  const CategoriesMealsScreen(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Receitas da categoria ${category.id}'),
      ),
    );
  }
}
