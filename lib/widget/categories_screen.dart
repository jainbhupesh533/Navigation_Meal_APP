import 'package:flutter/material.dart';
import './category_item.dart';
import '../data/dummy_data.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndianChops'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(25),

        // * without builder method
        // children: DATA_CATEGORY
        //     .map(
        //       (catDATA_CATEGORY) => CategoryItem(
        //         key: ValueKey(catDATA_CATEGORY.id),
        //         ctg: catDATA_CATEGORY,
        //       ),
        //     )
        //     .toList(),

        // * with builder method
        itemCount: DATA_CATEGORY.length,
        itemBuilder: (context, index) {
          return CategoryItem(
            key: ValueKey(DATA_CATEGORY[index].id),
            ctg: DATA_CATEGORY[index],
            // id: DATA_CATEGORY[index].id,
            // title: DATA_CATEGORY[index].title,
            // color: DATA_CATEGORY[index].color,
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
