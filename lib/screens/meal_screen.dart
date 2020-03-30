import 'package:flutter/material.dart';
import 'package:meal/constant.dart';
import 'package:meal/model/meal_model.dart';

class MealScreen extends StatelessWidget {
  final mealIndex;

  MealScreen({@required this.mealIndex});

  String _getMealTitle() {
    return MealModel.mealData[mealIndex]['meal'];
  }

  List<Widget> _getMealListTiles() {
    List<Widget> list = List<Widget>();
    List<Map> foods = MealModel.mealData[mealIndex]['foods'];

    list.add(MealTitle(
      title: _getMealTitle(),
    ));

    for (var i = 0; i < foods.length; i++) {
      final food = foods[i];
      list.add(MealListTile(
        foodImage: NetworkImage(food['picture']),
        foodName: food['food_name'],
        servingSize: food['serving_size'],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey.shade50,
      child: ListView(
        children: _getMealListTiles(),
      ),
    );
  }
}

class MealTitle extends StatelessWidget {
  final String title;

  MealTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 36.0, bottom: 16.0),
        child: Text(
          title,
          style: kMealTitleTextStyle,
        ),
      ),
    );
  }
}

class MealListTile extends StatelessWidget {
  final foodImage;
  final foodName;
  final servingSize;

  MealListTile({@required this.foodImage, @required this.foodName, @required this.servingSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 16.0,
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Image(
                image: foodImage,
                width: 75.0,
                height: 75.0,
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    foodName,
                    style: kFoodTitleTextStyle,
                  ),
                  Text(
                    servingSize,
                    style: kFoodServingSizeTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
