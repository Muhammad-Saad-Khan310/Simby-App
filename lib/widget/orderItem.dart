import "package:flutter/material.dart";
import 'package:restaurant/screens/cartScreen.dart';
import 'package:restaurant/screens/orderScreen.dart';
import 'package:provider/provider.dart';
import "../provider/orderProvider.dart";

class OrderItems extends StatefulWidget {
  static const routeName = "all-order-item";
  const OrderItems({super.key});

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

Widget CardWidget(
    double width, double height, String image, String title, String id) {
  return Container(
    width: width,
    height: height * 0.11,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(11),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.18),
          // blurRadius: 10,
          blurRadius: 5,
          offset: Offset(0, 7), // changes position of shadow
        ),
      ],
    ),
    child: Stack(
      children: [
        Positioned(
          left: 90,
          top: 5,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(23, 23, 23, 1)),
              ),
              Text(
                id,
                style: TextStyle(color: Color.fromRGBO(23, 23, 23, 1)),
              )
            ],
          ),
        ),
        Positioned(
          top: 15,
          left: 10,
          child: Image(
            image: AssetImage(image),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 10,
            left: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today - 55 PM",
                  style: TextStyle(
                      color: Color.fromRGBO(23, 23, 23, 1), fontSize: 10),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 10, right: 8, top: 4, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(20, 78, 226, 0.19)),
                  child: Text(
                    "out of delivery",
                    style: TextStyle(color: Color.fromRGBO(0, 38, 173, 1)),
                  ),
                )
              ],
            ))
      ],
    ),
  );
}

class _OrderItemsState extends State<OrderItems> {
  var _isInt = true;
  var id = "";
  @override
  void didChangeDependencies() async {
    if (_isInt) {
      id = ModalRoute.of(context)!.settings.arguments as String;
      await Provider.of<OrderProvider>(context, listen: false)
          .fetchOrderDetail(id);
      // await Provider.of<OrderProvider>(context, listen: false)
      //     .fetchAndSetOrders();
    }
    _isInt = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.arrow_back_ios),
                const Text(
                  "Orders",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(67, 172, 106, 1)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Image(
                    image: AssetImage("assets/restaurants/cart.png"),
                  ),
                )
              ],
            ),
            const Text(
              "Upcomming",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(30, 30, 30, 1),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CardWidget(
                width, height, "assets/cart/banana.png", "Banana", "#36R1786L"),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              "Previous Orders",
              style: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(30, 30, 30, 1),
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const MyOrderScreen()
            // CardWidget(width, height, "assets/cart/berry.png", "Blueberry",
            //     "#36R1786L"),
            // SizedBox(
            //   height: height * 0.02,
            // ),
            // CardWidget(
            //     width, height, "assets/cart/apple.png", "Apple", "#36R1786L"),
            // SizedBox(
            //   height: height * 0.02,
            // ),
            // CardWidget(
            //     width, height, "assets/cart/apple.png", "Tomato", "#36R1786L")
          ],
        ),
      ),
    );
  }
}
