import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static String routeName = "/filtter";

  final Function setFilter;
  final Map<String, bool> _currentFilter;

  FilterScreen(this._currentFilter, this.setFilter);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  initState() {
    _glutenFree = widget._currentFilter['gluten'];
    _vegetarian = widget._currentFilter['vegetarian'];
    _vegan = widget._currentFilter['vegan'];
    _lactoseFree = widget._currentFilter['lactose'];

    super.initState();
  }

  Widget buildSwitchListTle(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                return widget.setFilter(selectedFilter);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Ajust your meal selection!",
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchListTle(
                    "Gluten",
                    "only include gluten free meals",
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  buildSwitchListTle(
                    "lactose free",
                    "only include lactose free meals",
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  buildSwitchListTle(
                    "vegetarian",
                    "only include vegetarian free meals",
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  buildSwitchListTle(
                    "Vegan",
                    "only include vegan free meals",
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
