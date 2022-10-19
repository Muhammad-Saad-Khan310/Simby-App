import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:restaurant/provider/orderProvider.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  // var _isInit = true;

  // @override
  // void didChangeDependencies() async {
  //   if (_isInit) {
  //     await Provider.of<OrderProvider>(context).fetchAndSetOrders();
  //   }
  //   _isInit = false;
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // var id = ModalRoute.of(context)!.settings.arguments;

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // var orderData = Provider.of<OrderProvider>(context).orderList;

    return Consumer<OrderProvider>(builder: (context, orderData, child) {
      return Container(
        width: width,
        height: height * 0.4,
        child: ListView.builder(
            itemCount: orderData.getOrderItemList.length,
            itemBuilder: (context, i) {
              return MyOrderWidget(
                image: "assets/cart/berry.png",
                // image: orderData.getOrderItemList[i].productImage,
                orderId: "#36R1786L",
                // title: orderData[i].productName,
                itemName: orderData.getOrderItemList[i].productName,
              );
            }),
      );
    });
  }
}

class MyOrderWidget extends StatelessWidget {
  // const MyOrderWidget({super.key});
  final String itemName;
  final String orderId;
  final String image;

  MyOrderWidget(
      {required this.image, required this.orderId, required this.itemName});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.11,
      margin: EdgeInsets.only(bottom: 15),
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
                  itemName,
                  style: TextStyle(
                      fontSize: 20, color: Color.fromRGBO(23, 23, 23, 1)),
                ),
                Text(
                  orderId,
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
              // image: NetworkImage(image),
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
}
