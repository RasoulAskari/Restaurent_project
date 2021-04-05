import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleScreen;
  final Function isMealFavirate;

  MealDetailScreen(this.toggleScreen, this.isMealFavirate);

  static String mealDetailRoute = "/meal_detail";

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    Widget buildSectionTitle(String title) {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Text(title),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 200,
          width: 300,
          child: child);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                selectedMeal.imageUrl,
                width: double.infinity,
                height: 300,
              ),
            ),
            buildSectionTitle("ingredense"),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle("steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.steps[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
              isMealFavirate(selectedMeal.id) ? Icons.star : Icons.star_border),
          onPressed: () => toggleScreen(selectedMeal.id)),
    );
  }
}
