import 'package:flutter/material.dart';
import 'package:meal_app/widgets/category_meals_screen.dart';
import '../models/catergory.dart';
// import 'models/catergory.dart';
// import 'dummy_data.dart';

class CategoryItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final Color color;
  final Function deleteCat;
  final Category ctg;

  CategoryItem({
    Key key,
    // @required this.id,
    // @required this.title,
    // @required this.color,
    @required this.deleteCat,
    @required this.ctg,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    //! Old routing method
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id,title);
    //     },
    //   ),

    //* New routing method
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeNamed,
      arguments: {
        'id': ctg.id,
        'title': ctg.title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Stack(
          children: [
            Text(
              ctg.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            if (ctg.id.contains(new RegExp(r'[1-9][1-9]')) == true)
              Positioned(
                bottom: 0,
                right: -10,
                child: IconButton(
                  icon: Icon(Icons.delete),
                  hoverColor: Theme.of(context).errorColor,
                  onPressed: () => deleteCat(ctg.id),
                ),
              ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ctg.color.withOpacity(0.7),
              ctg.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
