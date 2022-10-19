import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;
import 'package:restaurant/model/orderDetailModel.dart';
import 'package:restaurant/model/orderItemModel.dart';
import "../model/orderModel.dart";
import "../url/api.dart";
import 'dart:convert';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orderList = [];
  List<OrderItemModel> _orderItemList = [];

  List<OrderModel> get orderList {
    return [..._orderList];
  }

  List<OrderItemModel> get getOrderItemList {
    return [..._orderItemList];
  }

  Future<void> fetchOrderLists() async {
    final url = Uri.parse(Api.orderList);
    final response = await http.post(url, body: {"vendor_id": "191"});
    // final response = await http.get(url);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final orderData = responseData["data"]["Order"];

      List<OrderModel> loadedItems = [];
      orderData.forEach((itemData) {
        loadedItems.insert(0, OrderModel.fromJson(itemData));
      });
      _orderList = loadedItems;
      notifyListeners();
    }
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(Api.orderList);
    // final response = await http.post(url, body: {'order_id': "15"});
    final response = await http.post(url, body: {"vendor_id": "191"});
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final orderProducts = responseData["data"]["Order"];

      print(orderProducts);
      List<OrderModel> loadedItems = [];
      orderProducts.forEach((itemData) {
        loadedItems.insert(0, OrderModel.fromJson(itemData));
      });
      _orderList = loadedItems;
      notifyListeners();
    } else {
      print("no order product found");
    }
  }

  Future<void> fetchOrderDetail(String orderId) async {
    print("i m not executing");
    final url = Uri.parse(Api.orderdetail);
    final response = await http.post(url, body: {"order_id": orderId});
    final responseData = jsonDecode(response.body);

    List<OrderItemModel> loadedItems = [];
    if (response.statusCode == 200) {
      final orderItems = responseData["data"]["orderproducts"];
      orderItems.forEach((itemData) {
        loadedItems.insert(0, OrderItemModel.fromJson(itemData));
      });
      _orderItemList = loadedItems;
      notifyListeners();
    }
  }
}
