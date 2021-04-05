import 'package:flutter/material.dart';
import '../models/meal.dart';
import './categories_screen.dart';
import './favirate_screen.dart';
import '../widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favirateMeal;
  static const routeName = "/tabScreen";
  TabScreen(this.favirateMeal);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _page;

  void initState() {
    _page = [
      {'page': CategoriesScreen(), 'title': "Category"},
      {'page': FavirateScreen(widget.favirateMeal), 'title': 'Your Favirate'}
    ];
    super.initState();
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          _page[_selectedPageIndex]['title'],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
        ],
      ),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text("category")),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text("Orders")),
        ],
      ),
    );
  }
}
