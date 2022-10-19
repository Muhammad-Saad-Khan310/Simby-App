import 'dart:async';

import 'dart:ui' as ui;
import 'package:provider/provider.dart';
import "package:flutter/material.dart";
import 'package:restaurant/widget/product.dart';
import '../provider/productsProvider.dart';
import "./Recommended.dart";

class RecommendedGrid extends StatefulWidget {
  const RecommendedGrid({super.key});

  @override
  State<RecommendedGrid> createState() => _RecommendedGridState();
}

class _RecommendedGridState extends State<RecommendedGrid> {
  var isint = true;
  var _isInit = true;

  @override
  void didChangeDependencies() async {
    if (_isInit) {
      await Provider.of<ProductProvider>(context).fetchAndSetProducts();
    }

    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // @override
  // void didChangeDependencies() async {
  //   if (_isInit) {
  //     await Provider.of<ProductProvider>(context).fetchAndSetProducts();
  //   }
  //   _isInit = false;

  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final gridData = Provider.of<ProductProvider>(context).grid;

    return Consumer<ProductProvider>(builder: (context, gridData, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: gridData.grid.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (ctx, i) {
              return GridItem(
                  id: gridData.grid[i].id,
                  imageUrl: "assets/restaurants/apple.png",
                  title: gridData.grid[i].productName);
            }),
      );
    });
  }
}

class GridItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  GridItem({required this.id, required this.imageUrl, required this.title});

  // const RecommendedGridItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    var imageHeight;
    var imageWidth;

    Widget ContainerWidget(
      double width,
      double height,
      String image,
    ) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductPage.routeName, arguments: id);
        },
        child: Container(
            width: width * 0.4,
            height: height * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromRGBO(224, 255, 236, 1)),
            child: Stack(
              children: [
                Positioned(
                    child: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(image),
                    ),
                    Image(
                      image: AssetImage("assets/restaurants/Ellipse.png"),
                    ),
                  ],
                ))),
                Positioned(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: ui.FontWeight.bold),
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Color.fromRGBO(67, 172, 106, 1),
                        )
                      ],
                    ),
                  ),
                )),
                Positioned(
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, bottom: 5, right: 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("\$4.68/kg"),
                              Row(children: [
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
                                )
                              ])
                            ],
                          ),
                        ))),
                Positioned(
                    child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Color.fromRGBO(248, 248, 248, 1),
                            child: Image(
                                image: AssetImage("assets/product/minus.png")),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text("1"),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Color.fromRGBO(67, 172, 106, 1),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 10,
                            ),
                          )
                        ]),
                  ),
                ))
              ],
            )),
      );
    }

    Future<Size> calculateImageDimension(String imageUrl) async {
      Completer<Size> completer = Completer();
      // Image image = Image.network("https://i.stack.imgur.com/lkd0a.png");
      Image image = Image.asset(imageUrl);
      image.image.resolve(ImageConfiguration()).addListener(
        ImageStreamListener(
          (ImageInfo image, bool synchronousCall) async {
            var myImage = image.image;
            Size size =
                Size(myImage.width.toDouble(), myImage.height.toDouble());
            imageHeight = size.height;
            imageWidth = size.width;

            completer.complete(size);
          },
        ),
      );
      return completer.future;
    }

    return ContainerWidget(width, height, imageUrl);
    // FutureBuilder(
    //     future: calculateImageDimension(imageUrl),
    //     builder: (ctx, AsyncSnapshot snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Text("Plz wait");
    //       } else {
    //         return ContainerWidget(
    //             width, height, imageHeight, imageWidth, imageUrl);
    //       }
    //     });
  }
}
