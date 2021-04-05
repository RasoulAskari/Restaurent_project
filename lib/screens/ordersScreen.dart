import '../models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  final List<Meal> favirateMeal;

  OrdersScreen(this.favirateMeal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              }),
        ],
      ),
      body: favirateMeal.isNotEmpty
          ? ListView.builder(
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
            )
          : Center(
              child: Text("There is No order by user"),
            ),
    );
  }
}
