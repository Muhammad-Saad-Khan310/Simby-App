import 'dart:async';

import 'dart:ui' as ui;

import "package:flutter/material.dart";

// import 'package:flutter/services.dart' show rootBundle;
// import 'package:path_provider/path_provider.dart';
// import 'package:http/retry.dart';

class RecommendedItem extends StatefulWidget {
  const RecommendedItem({super.key});

  @override
  State<RecommendedItem> createState() => _RecommendedItemState();
}

class _RecommendedItemState extends State<RecommendedItem> {
  var isint = true;
  var imageHeight;
  var imageWidth;

  Future<Size> _calculateImageDimension() async {
    Completer<Size> completer = Completer();
    // Image image = Image.network("https://i.stack.imgur.com/lkd0a.png");
    Image image = Image.asset("assets/product/pineapple.png");
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) async {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          imageHeight = size.height;
          imageWidth = size.width;
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }

  @override
  void didChangeDependencies() async {
    if (isint) {
      await _calculateImageDimension().then((size) => print(size));
    }
    isint = false;

    super.didChangeDependencies();
  }

  Widget ContainerWidget(
      double width, double height, double imageheight, double imageWidth) {
    return Container(
        width: width * 0.4,
        height: imageheight,
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
                  image: AssetImage("assets/restaurants/apple.png"),
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
                  children: [Text("Apples"), Icon(Icons.favorite_border)],
                ),
              ),
            )),
            Positioned(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, bottom: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("\$4.68/kg"),
                          Row(children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Icon(
                              Icons.star,
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
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  CircleAvatar(
                    radius: 13,
                    child: Icon(Icons.minimize_sharp),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text("1"),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.add),
                  ),
                ]),
              ),
            ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Future<void> getImage() async {

    //   @override
    // void didChangeDependencies() async {
    //   if (_isInit) {

    //   }
    //   _isInit = false;

    //   super.didChangeDependencies();
    // }

    // print("heelo");

    // File image = new File('assets/restaurants/pineapple.png');
    // final byteData = await rootBundle.load('assets/product/pineapple.png');
    // File image1 = new File("package:restaurant/assets/restaurants/pineapple");
    // var decodedImage = await decodeImageFromList(image.readAsBytesSync());
    // final file =
    //     File('${(await getTemporaryDirectory()).path}/product/pineapple.png');
    // await file.writeAsBytes(byteData.buffer
    //     .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    // print(file);
    // print(decodedImage.width);
    // print(decodedImage.height);
    // }

    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 20),
          child: GestureDetector(
            onTap: () {
              _calculateImageDimension()
                  .then((size) => print("size = ${size}"));

              // getImage();
            },
            child: FutureBuilder(
                future: _calculateImageDimension(),
                builder: (ctx, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("df");
                    // return ListTile(
                    //   leading: const Icon(Icons.add_box),
                    //   title: const Text("Add Product"),
                    //   onTap: () {
                    //     Navigator.of(context).pushNamed(AddProduct.routeName);
                    //   },
                    // );
                    // } else {
                    //   return const Text("");
                    // }
                  } else {
                    return ContainerWidget(
                        width, height, imageHeight, imageWidth);
                  }
                }

                // containerWidth > contianerHeight
                //     ? Container(
                //         width: width * 0.4,
                //         height: height * 0.25,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: Color.fromRGBO(224, 255, 236, 1)),
                //         child: Stack(
                //           children: [
                //             Positioned(
                //                 child: Center(
                //                     child: Column(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               children: [
                //                 Image(
                //                   image: AssetImage("assets/restaurants/apple.png"),
                //                 ),
                //                 Image(
                //                   image: AssetImage("assets/restaurants/Ellipse.png"),
                //                 ),
                //               ],
                //             ))),
                //             Positioned(
                //                 child: Align(
                //               alignment: Alignment.topRight,
                //               child: Padding(
                //                 padding: const EdgeInsets.only(
                //                     left: 10, right: 10, top: 5),
                //                 child: Row(
                //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Text("Apples"),
                //                     Icon(Icons.favorite_border)
                //                   ],
                //                 ),
                //               ),
                //             )),
                //             Positioned(
                //                 child: Align(
                //                     alignment: Alignment.bottomLeft,
                //                     child: Padding(
                //                       padding: const EdgeInsets.only(
                //                           left: 10, bottom: 5, right: 5),
                //                       child: Column(
                //                         mainAxisAlignment: MainAxisAlignment.end,
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           Text("\$4.68/kg"),
                //                           Row(children: [
                //                             Icon(
                //                               Icons.star,
                //                               color: Colors.amber,
                //                             ),
                //                             Icon(
                //                               Icons.star,
                //                               color: Colors.amber,
                //                             )
                //                           ])
                //                         ],
                //                       ),
                //                     ))),
                //             Positioned(
                //                 child: Align(
                //               alignment: Alignment.bottomRight,
                //               child: Padding(
                //                 padding: const EdgeInsets.only(right: 10, bottom: 5),
                //                 child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.end,
                //                     children: [
                //                       CircleAvatar(
                //                         radius: 13,
                //                         child: Icon(Icons.minimize_sharp),
                //                       ),
                //                       SizedBox(
                //                         height: height * 0.01,
                //                       ),
                //                       Text("1"),
                //                       SizedBox(
                //                         height: height * 0.01,
                //                       ),
                //                       CircleAvatar(
                //                         radius: 13,
                //                         backgroundColor: Colors.green,
                //                         child: Icon(Icons.add),
                //                       ),
                //                     ]),
                //               ),
                //             ))
                //           ],
                //         ))
                //     : Container(
                //         decoration: BoxDecoration(
                //           color: Colors.green,
                //         ),
                //         height: 400,
                //         width: 200,
                //       ),
                ),
          )),
    ));
  }
}
