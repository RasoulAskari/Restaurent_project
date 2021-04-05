import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeal;
  static const category_meals = '/category_meals';
  // final String id;
  // final String title;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String mealTitle;
  List<Meal> displayMeals;
  bool _loadInitData = false;
  @override
  didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if (!_loadInitData) {
      final routeArges =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      mealTitle = routeArges['title'];
      final id = routeArges['id'];
      displayMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(id);
      }).toList();

      _loadInitData = true;
    }
  }

  @override
  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          mealTitle,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: displayMeals[index].id,
              title: displayMeals[index].title,
              imageUrl: displayMeals[index].imageUrl,
              duration: displayMeals[index].duration,
              complexity: displayMeals[index].complexity,
              affordability: displayMeals[index].affordability,
            );
          },
          itemCount: displayMeals.length,
        ),
      ),
    );
  }
}
