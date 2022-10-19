// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.id,
    required this.categoryName,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.unitValue,
    required this.unitName,
    required this.productNote,
    required this.verified,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String categoryName;
  String productImage;
  String productName;
  String productPrice;
  String unitValue;
  String unitName;
  String productNote;
  String verified;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        categoryName: json["category_name"],
        productImage: json["ProductImage"],
        productName: json["product_name"],
        productPrice: json["product_price"],
        unitValue: json["unit_value"],
        unitName: json["unit_name"],
        productNote: json["product_note"],
        verified: json["verified"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "ProductImage": productImage,
        "product_name": productName,
        "product_price": productPrice,
        "unit_value": unitValue,
        "unit_name": unitName,
        "product_note": productNote,
        "verified": verified,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
