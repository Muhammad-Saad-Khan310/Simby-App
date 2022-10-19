import "package:flutter/cupertino.dart";
import "package:http/http.dart" as http;
import 'dart:convert';

import '../url/api.dart';

import "../model/cartModel.dart";

class CartProvider with ChangeNotifier {
  List<CartModel> _cartItems = [];

  List<CartModel> get cartItems {
    return [..._cartItems];
  }

  Future<void> fetchCartItems() async {
    final url = Uri.parse(Api.cartItem);

    // final response = await http.post(url, body: {"product_id": "18"});
    final response = await http.get(url);
    final responseData = json.decode(response.body);
    var data1 = responseData["data"]["cartItems"];
    print(responseData);
    print(data1);
    List<CartModel> loadedItems = [];
    // data.forEach((cartItemId, cartData) {
    //   loadedItems.insert(0, CartModel(id: id, qty: cartItemId, price: price, name: name, image: image, rowid: rowid, subtotal: subtotal))
    // });
  }

  Future<String> placeOrder() async {
    final url = Uri.parse(Api.placeOrder);
    final response = await http.post(url, body: {
      "first_name": "leroy",
      "last_name": "smith",
      "company_name": "rooftop",
      "phone": "03467894561",
      "email": "rooftop@gmail.com",
      "password": "test1234"
    });
    final responseData = json.decode(response.body);
    return responseData["message"];
  }

  Future<String> removeCartProduct() async {
    final url = Uri.parse(Api.deleteCartItem);
    final response = await http
        .post(url, body: {"rowid": "37693cfc748049e45d87b8c7d8b9aacd"});
    final responseData = json.decode(response.body);
    return responseData["message"];
  }

  Future<String> updateCartProduct() async {
    final url = Uri.parse(Api.updateItem);
    final response = await http.post(url,
        body: {"rowid": "c74d97b01eae257e44aa9d5bade97baf", "qty": "2"});
    final responseData = json.decode(response.body);
    return responseData["message"];
  }
}
