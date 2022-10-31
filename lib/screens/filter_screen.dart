import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  // const FilterScreen({super.key});
  static const routeName = '/filter';

  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String description, bool currentValue, bool flag) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (newValue) {
        setState(() {
          flag = newValue;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                    'lactose': _lactoseFree,
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text('Gluten-free'),
                    value: _glutenFree,
                    subtitle: Text('Only include gluten-free meals.'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose-free'),
                    value: _lactoseFree,
                    subtitle: Text('Only include lactose-free meals.'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: Text('Only include Vegetarian meals.'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: _vegan,
                    subtitle: Text('Only include Vegan meals.'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
