import 'package:flutter/material.dart';

import 'deep2.dart';

void main() {
  runApp(const MaterialApp(home: PizzaConditionalsGame()));
}
class PizzaConditionalsGame extends StatelessWidget {
  const PizzaConditionalsGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Conditionals Game',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'ComicNeue',
      ),
      debugShowCheckedModeBanner: false,
      home: const GameHomeScreen(),
    );
  }
}
