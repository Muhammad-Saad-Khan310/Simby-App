import 'package:flutter/material.dart';
import "package:provider/provider.dart";

import "../provider/cartProvider.dart";
import '../screens/cartScreen.dart';
import "./payment.dart";

class Cart extends StatefulWidget {
  static const routeName = "add-cart";
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var isInt = true;

  @override
  void didChangeDependencies() async {
    if (isInt) {
      await Provider.of<CartProvider>(context).fetchCartItems();
    }
    isInt = false;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  // Widget CardWidget(
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    void _addressForm() {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                contentPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Builder(
                  builder: (context) {
                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;

                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 20,
                        ),
                        height: height - 225,
                        width: width,
                        child: Column(
                          children: [
                            Text(
                              "Added a new Address",
                              style: TextStyle(
                                  color: Color.fromRGBO(67, 172, 106, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'Address line 1',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'Address line 2',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'City',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'State',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'Postal code',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: height * 0.09,
                            ),
                            Container(
                              height: height * 0.07,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 172, 106, 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(Payment.routeName);
                                  },
                                  child: Text(
                                    "Done",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          width: width,
          height: height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                      Text(
                        "Cart",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(67, 172, 106, 1)),
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
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CartScreen(),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  // CardWidget(width, height, "assets/cart/banana.png", "Banana",
                  //     "\$8.89/Kg"),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // CardWidget(width, height, "assets/cart/berry.png",
                  //     "Blueberry", "\$8.89Kg"),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  // CardWidget(width, height, "assets/cart/apple.png", "Apple",
                  //     "\$8.89Kg"),
                  // SizedBox(
                  //   height: height * 0.02,
                  // ),
                  Align(alignment: Alignment.topLeft, child: Text("Address")),
                  Container(
                    height: 70,
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.only(left: 0, bottom: 0),
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          leading: Icon(
                            Icons.circle_outlined,
                            color: Colors.green,
                            size: 15,
                          ),
                          title: Transform.translate(
                            offset: Offset(-25, 0),
                            child: Text("Added Address"),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(left: 0, bottom: 0, top: 0),
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          leading: Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 15,
                          ),
                          title: Transform.translate(
                            offset: Offset(-25, 0),
                            child: Text("Added Address"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery free",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
                      ),
                      Text("Free")
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ 36.90",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.07,
                    width: width,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(67, 172, 106, 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        onPressed: () {
                          _addressForm();
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
