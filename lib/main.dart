import 'package:flutter/material.dart';
import 'package:meal/screens/meal_screen.dart';
import 'package:meal/model/meal_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  List<Widget> getAllScreen() {
    List<Widget> list = List<Widget>();
    for (var i = 0; i < MealModel.mealData.length; i++) {
      list.add(MealScreen(mealIndex: i));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal',
      home: PageView(
        controller: controller,
        children: getAllScreen(),
      ),
    );
  }
}
