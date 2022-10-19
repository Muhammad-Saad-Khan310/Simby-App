// To parse this JSON data, do
//
//     final categoryProductModel = categoryProductModelFromJson(jsonString);

import 'dart:convert';

CategoryProductModel categoryProductModelFromJson(String str) =>
    CategoryProductModel.fromJson(json.decode(str));

String categoryProductModelToJson(CategoryProductModel data) =>
    json.encode(data.toJson());

class CategoryProductModel {
  CategoryProductModel({
    required this.id,
    required this.categoryName,
    required this.productImage,
    required this.productName,
    required this.productPrice,
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
  String productNote;
  String verified;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductModel(
        id: json["id"],
        categoryName: json["category_name"],
        productImage: json["ProductImage"],
        productName: json["product_name"],
        productPrice: json["product_price"],
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
        "product_note": productNote,
        "verified": verified,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
