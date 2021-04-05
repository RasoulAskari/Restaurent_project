import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavirateScreen extends StatelessWidget {
  final List<Meal> favirateMeal;

  FavirateScreen(this.favirateMeal);

  @override
  Widget build(BuildContext context) {
    if (favirateMeal.isEmpty) {
      return Center(child: Text("You have no order yet -- start adding some!"));
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favirateMeal[index].id,
            title: favirateMeal[index].title,
            imageUrl: favirateMeal[index].imageUrl,
            duration: favirateMeal[index].duration,
            complexity: favirateMeal[index].complexity,
            affordability: favirateMeal[index].affordability,
          );
        },
        itemCount: favirateMeal.length,
      );
    }
  }
}
