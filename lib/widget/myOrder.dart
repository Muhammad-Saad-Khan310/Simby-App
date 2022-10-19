import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:restaurant/provider/orderProvider.dart';
import 'package:restaurant/widget/orderItem.dart';

class MyOrderList extends StatefulWidget {
  static const routeName = "order-item";
  const MyOrderList({super.key});

  @override
  State<MyOrderList> createState() => _MyOrderListState();
}

class _MyOrderListState extends State<MyOrderList> {
  var _isInt = true;

  @override
  void didChangeDependencies() async {
    if (_isInt) {
      await Provider.of<OrderProvider>(context, listen: false)
          .fetchOrderLists();
    }
    _isInt = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<OrderProvider>(context).orderList;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: ListView.builder(
            itemCount: orderData.length,
            itemBuilder: ((context, i) {
              return OrderItemWidget(
                orderId: orderData[i].id,
                vendorName: orderData[i].vendorName,
                grandTotal: orderData[i].grandTotal,
                invoiceNumber: orderData[i].invoiceNumber,
              );
            })),
      ),
    );
  }
}

class OrderItemWidget extends StatelessWidget {
  // const OrderItemWidget({super.key});
  final String orderId;
  final String vendorName;
  final String invoiceNumber;
  final String grandTotal;
  OrderItemWidget(
      {required this.orderId,
      required this.vendorName,
      required this.grandTotal,
      required this.invoiceNumber});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(OrderItems.routeName, arguments: orderId);
      },
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        padding: EdgeInsets.only(left: 10, right: 10),
        width: width,
        height: height * 0.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Vendor:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(vendorName)
              ],
            ),
            Row(
              children: [
                Text(
                  "Total:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(grandTotal),
              ],
            ),
            Text(invoiceNumber)
          ],
        ),
      ),
    );
  }
}
