import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/category.dart';
import 'package:restaurant/screens/categoryScreen.dart';

import '../provider/productsProvider.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  var _isInit = true;
  final List<Color> categoriesColors = [
    Color.fromRGBO(255, 102, 102, 1),
    Color.fromRGBO(102, 136, 255, 1),
    Color.fromRGBO(250, 152, 80, 1),
    Color.fromRGBO(175, 80, 250, 1),
  ];
  final List<String> images = [
    "assets/restaurants/sweets.png",
    "assets/restaurants/spices.png",
    "assets/restaurants/green.png",
    "assets/restaurants/sours.png"
  ];

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await Provider.of<CategoryProvider>(context).fetchAndSetsCategory();
    }
    _isInit = false;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  // @override
  // void initState() async {
  //   Future.delayed(Duration.zero).then((_) {
  //     Provider.of<CategoryProvider>(context).fetchAndSetsCategory();
  //   });

  //       .fetchAndSetsCategory()
  // TODO: implement initState
  // super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // var categoryData = Provider.of<CategoryProvider>(context).categoriesItem;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Consumer<CategoryProvider>(builder: (context, categoryData, child) {
      return Container(
        width: width,
        height: height * 0.2,
        child: ListView.builder(
            itemCount: categoryData.categoriesItem.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, i) {
              return CategoryWidget(
                id: categoryData.categoriesItem[i].id,
                color: categoriesColors[i],
                name: categoryData.categoriesItem[i].name,
                imageUrl: images[i],
                description: categoryData.categoriesItem[i].description,
              );
            }),
      );
    });
  }
}

class CategoryWidget extends StatelessWidget {
  // const CategoryWidget({super.key});
  final String id;
  final String name;
  final Color color;
  final String imageUrl;
  final String description;

  CategoryWidget(
      {required this.id,
      required this.color,
      required this.imageUrl,
      required this.name,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(ProductCategoryScreen.routeName, arguments: id);
      },
      child: Container(
        width: width * 0.23,
        height: height * 0.2,
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Stack(children: [
          Positioned(
              child: Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage(imageUrl)),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  name,
                  style: TextStyle(color: Colors.white),
                ),
                // Center(
                //   child: Text(description,
                //       style: TextStyle(fontSize: 10, color: Colors.white)),
                // ),
              ],
            ),
          )),
        ]),
      ),
    );
    ;
  }
}
