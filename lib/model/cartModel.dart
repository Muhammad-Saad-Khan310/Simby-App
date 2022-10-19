// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    required this.id,
    required this.qty,
    required this.price,
    required this.name,
    required this.image,
    required this.rowid,
    required this.subtotal,
  });

  String id;
  int qty;
  int price;
  String name;
  String image;
  String rowid;
  int subtotal;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        qty: json["qty"],
        price: json["price"],
        name: json["name"],
        image: json["image"],
        rowid: json["rowid"],
        subtotal: json["subtotal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qty": qty,
        "price": price,
        "name": name,
        "image": image,
        "rowid": rowid,
        "subtotal": subtotal,
      };
}
