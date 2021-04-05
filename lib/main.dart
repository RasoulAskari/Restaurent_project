import './screens/ordersScreen.dart';
import 'package:flutter/material.dart';
import './models/dummy_data.dart';
import './screens/admin_login_screen.dart';
import './screens/filters_screen.dart';
import './screens/start_screen.dart';
import './screens/user_login_screen.dart';
import './screens/tab_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> _favirateMeal = [];

  void toggleFavirate(String mealId) {
    final existingIndex = _favirateMeal.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (existingIndex >= 0) {
        _favirateMeal.removeAt(existingIndex);
      } else {
        _favirateMeal.add(DUMMY_MEALS.firstWhere((meal) => mealId == meal.id));
      }
    });
  }

  bool _isMealFavirate(String mealId) {
    return _favirateMeal.any(((meal) => meal.id == mealId));
  }

  void _setFilter(Map<String, bool> fiterData) {
    setState(() {
      filters = fiterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 1, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => StartScreen(),
        AdminLoginScreen.routeName: (_) => AdminLoginScreen(),
        UserLoginScreen.routeName: (_) => UserLoginScreen(),
        // '/': (_) => TabScreen(_favirateMeal),
        CategoryMealsScreen.category_meals: (_) =>
            CategoryMealsScreen(_availableMeal),
        MealDetailScreen.mealDetailRoute: (_) =>
            MealDetailScreen(toggleFavirate, _isMealFavirate),
        FilterScreen.routeName: (_) => FilterScreen(filters, _setFilter),
        TabScreen.routeName: (_) => TabScreen(_favirateMeal),
        OrdersScreen.routeName: (_) => OrdersScreen(_favirateMeal)
      },
    );
  }
}
