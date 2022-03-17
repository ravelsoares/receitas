import 'package:flutter/material.dart';
import 'package:receitas/screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
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
              headline6: const TextStyle(fontSize: 20),
            ),
      ),
      home: const CategoriesScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
