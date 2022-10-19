import 'package:flutter/material.dart';
import 'package:restaurant/provider/cartProvider.dart';
import 'package:restaurant/widget/orderItem.dart';
import "package:provider/provider.dart";

class ReviewOrder extends StatelessWidget {
  static const routeName = "review-order";
  const ReviewOrder({super.key});

  Widget ContainerBox(double width, double height) {
    return Container(
      width: width,
      height: height * 0.12,
      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Color.fromRGBO(187, 187, 187, 1))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tomato Veggie",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(23, 23, 23, 1)),
              ),
              Text(
                "#36R1786L",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today - 4:55PM",
                style: TextStyle(color: Color.fromRGBO(23, 23, 23, 1)),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(20, 78, 226, 0.19)),
                child: Text(
                  "out of delivery",
                  style: TextStyle(color: Color.fromRGBO(0, 38, 173, 1)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Future<void> submit() async {
      await Provider.of<CartProvider>(context, listen: false)
          .placeOrder()
          .then((value) {
        final snackBar = SnackBar(
          content: Text(value),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios),
                    Text(
                      "Review Order",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromRGBO(67, 172, 106, 1)),
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
                  height: height * 0.03,
                ),
                Container(
                  width: width,
                  height: height * 0.12,
                  padding: EdgeInsets.only(
                      left: width * 0.2, top: 10, bottom: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border:
                          Border.all(color: Color.fromRGBO(187, 187, 187, 1))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Tomato Veggie",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(23, 23, 23, 1)),
                          ),
                          Text(
                            "#36R1786L",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today - 4:55PM",
                            style:
                                TextStyle(color: Color.fromRGBO(23, 23, 23, 1)),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 10, right: 8, top: 4, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromRGBO(20, 78, 226, 0.19)),
                            child: Text(
                              "out of delivery",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 38, 173, 1)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                ContainerBox(width, height),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery fee:",
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
                    ),
                    Text("\$ 4.00")
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                    Text(
                      "\$ 36.90",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      "with extra salad please",
                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image(image: AssetImage("assets/reviewOrder/comment.png"))
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Order Details",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
                    Row(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Selected Card",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 6, right: 6, top: 4, bottom: 4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(45, 173, 0, 0.19),
                              ),
                              child: Text(
                                "paid",
                                style: TextStyle(
                                    color: Color.fromRGBO(31, 118, 0, 1)),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery address",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1378 St. Jhon Street",
                            style:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
                        Text("Conquest Staskatchewan",
                            style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Phone",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7))),
                    Text("+123 4567 890 1011",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)))
                  ],
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              height: height * 0.07,
              width: width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(67, 172, 106, 1),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                  onPressed: () {
                    submit();
                    // Navigator.of(context).pushNamed(MyOrders.routeName);
                  },
                  child: Text(
                    "Place Order",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
