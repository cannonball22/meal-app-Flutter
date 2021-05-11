import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Map<String, bool> currentFilters;

  final Function saveFilters;
  FilterScreen({this.saveFilters, this.currentFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      {@required String titleText,
      @required String descriptionText,
      @required bool currentValue,
      @required Function updateValue}) {
    return SwitchListTile(
      title: Text(titleText),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(descriptionText),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedFilter = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };

                  widget.saveFilters(selectedFilter);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _buildSwitchListTile(
                  titleText: 'Gluten-free',
                  descriptionText: 'Only include gluten-free meals.',
                  currentValue: _glutenFree,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  titleText: 'Vegetarian',
                  descriptionText: 'Only include vegetarian meals.',
                  currentValue: _vegetarian,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  titleText: 'vegan',
                  descriptionText: 'Only include vegan meals.',
                  currentValue: _vegan,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  titleText: 'Lactose-free',
                  descriptionText: 'Only include lactose-Free meals.',
                  currentValue: _lactoseFree,
                  updateValue: (newValue) {
                    setState(
                      () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
