import 'package:flutter/material.dart';
import 'package:receitas/components/main_drawer.dart';
import 'package:receitas/screens/categories_screen.dart';
import 'package:receitas/screens/favorite_screen.dart';

import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabScreen(this.favoriteMeals, {Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
  late List<Widget> _screens;
  late List<String> _titles;

  @override
  void initState() {
    super.initState();
    _screens = [
      CategoriesScreen(),
      FavoriteScreen(widget.favoriteMeals),
    ];
    _titles = [
      'Lista de Categorias',
      'Meus Favoritos',
    ];
  }

  _selectScreen(index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedScreenIndex]),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categoria',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
