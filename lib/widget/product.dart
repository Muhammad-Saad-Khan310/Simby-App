import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:restaurant/provider/productsProvider.dart';
import "./cart.dart";

class ProductPage extends StatefulWidget {
  static const routeName = "product-page";
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var id;
  var _isLoading = false;

  Future<void> addToCart() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<ProductProvider>(context, listen: false)
        .addToCart(id)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
      final snackBar = SnackBar(
        content: Text(value),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    id = ModalRoute.of(context)!.settings.arguments as String;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              width: width,
              height: height,
              child: Stack(
                children: [
                  Positioned(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Image(
                                image: AssetImage("assets/product/back.png"),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image(
                                image:
                                    AssetImage("assets/restaurants/cart.png"),
                              ),
                            )
                          ],
                        ),
                        Image(
                          image: AssetImage("assets/restaurants/apple.png"),
                        ),
                        Image(image: AssetImage("assets/product/Ellipse.png")),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Apple",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text("\$ 12.30/kg",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Flexible(
                            child: Text(
                                "Marinated mediterranean seabass accompanied by a slow cooked vegeteable passee. Marinated mediterranean seabass accompanied by a slow cooked vegeteable passee")),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.white,
                                          child: Center(
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/product/minus.png")),
                                          )),
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    Text("1"),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundColor: Colors.green,
                                        child: Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(207, 207, 207, 1)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Extras")),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        // The below row for fruits
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(
                                image: AssetImage("assets/product/banana.png")),
                            const Text("Bananas"),
                            const Image(
                                image:
                                    AssetImage("assets/product/dotedline.png")),
                            GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/product/minus.png")),
                                  )),
                            ),
                            Text("0"),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.add,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(
                                image:
                                    AssetImage("assets/product/blueberry.png")),
                            const Text("Bananas"),
                            const Image(
                                image:
                                    AssetImage("assets/product/dotedline.png")),
                            GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/product/minus.png")),
                                  )),
                            ),
                            Text("0"),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.add,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(
                                image: AssetImage("assets/product/apple.png")),
                            const Text("Bananas"),
                            const Image(
                                image:
                                    AssetImage("assets/product/dotedline.png")),
                            GestureDetector(
                              onTap: () {},
                              child: const CircleAvatar(
                                  radius: 10,
                                  backgroundColor: Colors.white,
                                  child: Center(
                                    child: Image(
                                        image: AssetImage(
                                            "assets/product/minus.png")),
                                  )),
                            ),
                            Text("0"),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                                child: Icon(
                                  Icons.add,
                                  size: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(width - 30, 50),
                          primary: Color.fromRGBO(67, 172, 106, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () async {
                          addToCart();
                          // await Provider.of<ProductProvider>(context, listen: false)
                          //     .addToCart("productId");
                          // Navigator.of(context).pushNamed(Cart.routeName);
                        },
                        child: Text("Add to Cart")),
                  )
                ],
              ),
            ),
    );
  }
}
