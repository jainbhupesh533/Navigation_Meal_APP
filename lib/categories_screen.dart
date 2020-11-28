import 'package:flutter/material.dart';
import 'category_add.dart';
import 'category_item.dart';
import './models/catergory.dart';
import 'dummy_data.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  

  void _addNewCategory(String txTitle, Color enteredColor) {
    int _sum = DATA.length;
    var calcLength = _sum+1;
    print(calcLength);
    final newCategoryList = Category(
      id: 'C$calcLength',
      title: txTitle,
      color: enteredColor,
    );

    setState(() {
      DATA.add(newCategoryList);
    });
  }

  void _deleteTransaction(String id) {
    print(id);
    setState(() {
      DATA.removeWhere((cat) => cat.id == id);
    });
  }

  void _startAddNewCategory(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewCategory(_addNewCategory);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndianChops'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewCategory(context),
            color: Colors.black,
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(25),

        // * without builder method
        // children: DATA
        //     .map(
        //       (catData) => CategoryItem(
        //         key: ValueKey(catData.id),
        //         ctg: catData,
        //         deleteCat: _deleteTransaction,
        //       ),
        //     )
        //     .toList(),

        // * with builder method
        itemCount: DATA.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            key: ValueKey(DATA[index].id),
            deleteCat: _deleteTransaction,
            ctg: DATA[index],
            // id: DATA[index].id,
            // title: DATA[index].title,
            // color: DATA[index].color,
          );
        },
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
