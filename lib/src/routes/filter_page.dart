import 'package:flutter/material.dart';
import '../widget/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, dynamic> currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    var currentValue,
    Function updateValue,
  ) {
    return SwitchListTile.adaptive(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      value: currentValue,
      subtitle: Text(
        description,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onChanged: updateValue,
    );
  }

  void _savingFilters() {
    final selectedFilters = {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };

    return widget.saveFilters(selectedFilters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _savingFilters,
            // {
            // final selectedFilters = {
            //   'gluten': _glutenFree,
            //   'lactose': _lactoseFree,
            //   'vegan': _vegan,
            //   'vegetarian': _vegetarian,
            // };
            // widget.saveFilters(selectedFilters);
            // }
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: _savingFilters,
      ),
    );
  }
}
