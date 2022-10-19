import 'package:flutter/material.dart';
import 'package:restaurant/widget/RecommendGrid.dart';
import 'package:restaurant/widget/Recommended.dart';
import 'package:restaurant/widget/categoriesGrid.dart';
import 'package:restaurant/widget/profile.dart';

import 'package:provider/provider.dart';
import "../provider/category.dart";
import '../provider/productsProvider.dart';

class Home extends StatefulWidget {
  static const routeName = "homePage";
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _isInit = true;

  // @override
  // void didChangeDependencies() async {
  //   if (_isInit) {
  //     await Future.wait([
  //       Provider.of<CategoryProvider>(context).fetchAndSetsCategory(),
  //       Provider.of<ProductProvider>(context).fetchAndSetProducts(),
  //     ]);
  //   }

  // await Provider.of<CategoryProvider>(context)
  //     .fetchAndSetsCategory();

  // await Provider.of<ProductProvider>(context)
  //     .fetchAndSetProducts();

  // _isInit = false;
  // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  Widget CardImage(
      double w, double h, String image, String title, String content) {
    return Container(
      width: w * 0.7,
      height: h * 0.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(224, 255, 236, 1)),
      child: Stack(
        children: [
          Positioned(
            top: 5,
            left: 5,
            right: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                    width: w * 0.7,
                    height: h * 0.14,
                  ),
                ),
                SizedBox(
                  height: h * 0.02,
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  content,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Stack(
          children: [
            Positioned(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: width * 0.05,
                        right: width * 0.05,
                        top: height * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(Profile.routeName);
                          },
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image(
                                  image: AssetImage(
                                      "assets/restaurants/drawerIcon.png"))),
                        ),
                        Text(
                          "Restaurants",
                          style: TextStyle(fontSize: 20, color: Colors.green),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image(
                            image: AssetImage("assets/restaurants/cart.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    padding: EdgeInsets.only(left: 17, right: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "What are you looking for",
                          suffixIcon: Icon(Icons.search),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Popular Products",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                      // right: width * 0.05,
                    ),
                    height: height * 0.24,
                    width: width,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      CardImage(
                          width,
                          height,
                          "assets/restaurants/fruits.png",
                          "Farmer Abc - Apple",
                          "Pakistani food, Fast food, Burger"),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      CardImage(
                          width,
                          height,
                          "assets/restaurants/vegetables.png",
                          "Farmer Abc - Tomatoes",
                          "Pakistani food, Fast food, Burger"),
                      // ImageCard(height, width)
                    ]),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Explore Categories",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          "View all",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width,
                    height: height * 0.16,
                    padding: EdgeInsets.only(
                      left: width * 0.05,
                    ),
                    child: const CategoriesGrid(),
                    // ListView(
                    //   scrollDirection: Axis.horizontal,
                    //   children: [
                    //     IconCard2(
                    //         width,
                    //         height,
                    //         Color.fromRGBO(255, 102, 102, 1),
                    //         "assets/restaurants/sweets.png",
                    //         "Food",
                    //         "2215 Places"),
                    //     SizedBox(
                    //       width: width * 0.03,
                    //     ),
                    //     IconCard2(
                    //         width,
                    //         height,
                    //         Color.fromRGBO(102, 136, 255, 1),
                    //         "assets/restaurants/spices.png",
                    //         "Spices",
                    //         "215"),
                    //     SizedBox(
                    //       width: width * 0.03,
                    //     ),
                    //     IconCard2(
                    //       width,
                    //       height,
                    //       Color.fromRGBO(250, 152, 80, 1),
                    //       "assets/restaurants/green.png",
                    //       "Greens",
                    //       "124 Places",
                    //     ),
                    //     SizedBox(
                    //       width: width * 0.03,
                    //     ),
                    //     IconCard2(
                    //         width,
                    //         height,
                    //         Color.fromRGBO(175, 80, 250, 1),
                    //         "assets/restaurants/sours.png",
                    //         "Sours",
                    //         "2215 Places"),
                    //   ],
                    // ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: width * 0.05, right: width * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Recommended",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text("view all")
                      ],
                    ),
                  ),
                  RecommendedGrid(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
