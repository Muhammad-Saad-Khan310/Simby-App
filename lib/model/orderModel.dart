// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.id,
    required this.vendorName,
    required this.invoiceNumber,
    required this.grandTotal,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String vendorName;
  String invoiceNumber;
  String grandTotal;
  DateTime createdAt;
  DateTime updatedAt;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        vendorName: json["vendor_name"],
        invoiceNumber: json["invoice_number"],
        grandTotal: json["grand_total"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "vendor_name": vendorName,
        "invoice_number": invoiceNumber,
        "grand_total": grandTotal,
        "created_at":
            "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
        "updated_at":
            "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
      };
}
