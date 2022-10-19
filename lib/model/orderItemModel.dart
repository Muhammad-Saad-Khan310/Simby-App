// To parse this JSON data, do
//
//     final orderItemModel = orderItemModelFromJson(jsonString);

import 'dart:convert';

OrderItemModel orderItemModelFromJson(String str) =>
    OrderItemModel.fromJson(json.decode(str));

String orderItemModelToJson(OrderItemModel data) => json.encode(data.toJson());

class OrderItemModel {
  OrderItemModel({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.price,
    required this.subTotal,
    required this.status,
    required this.supplierId,
    required this.categoryId,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.categoryName,
  });

  String id;
  String orderId;
  String productId;
  String quantity;
  String price;
  String subTotal;
  String status;
  String supplierId;
  String categoryId;
  String productImage;
  String productName;
  String productPrice;
  String categoryName;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
        id: json["id"] ?? "",
        orderId: json["order_id"] ?? "",
        productId: json["product_id"] ?? "",
        quantity: json["quantity"] ?? "",
        price: json["price"] ?? "",
        subTotal: json["sub_total"] ?? "",
        status: json["status"] ?? "",
        supplierId: json["supplier_id"] ?? "",
        categoryId: json["category_id"] ?? "",
        productImage: json["ProductImage"] ?? "",
        productName: json["product_name"] ?? "",
        productPrice: json["product_price"] ?? "",
        categoryName: json["category_name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "sub_total": subTotal,
        "status": status,
        "supplier_id": supplierId,
        "category_id": categoryId,
        "ProductImage": productImage,
        "product_name": productName,
        "product_price": productPrice,
        "category_name": categoryName,
      };
}
