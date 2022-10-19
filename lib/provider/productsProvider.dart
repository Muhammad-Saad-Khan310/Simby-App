import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/productModel.dart';
import '../model/categoryProductModel.dart';
import 'package:http/http.dart' as http;

import '../url/api.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _gridItems = [];
  List<CategoryProductModel> _categoriesItems = [];

  // List<> _gridItems = [
  // GridModal(
  //     id: "1",
  //     imageUrl: "assets/restaurants/apple.png",
  //     price: "3.3",
  //     title: "apple"),
  // GridModal(
  //     id: "2",
  //     imageUrl: "assets/restaurants/apple.png",
  //     price: "3.3",
  //     title: "apple"),
  // GridModal(
  //     id: "3",
  //     imageUrl: "assets/restaurants/apple.png",
  //     price: "3.3",
  //     title: "apple"),
  // GridModal(
  //     id: "4",
  //     imageUrl: "assets/restaurants/apple.png",
  //     price: "3.3",
  //     title: "apple"),
  // ];
  List<ProductModel> get grid {
    return [..._gridItems];
  }

  List<CategoryProductModel> get categoryItems {
    return [..._categoriesItems];
  }

  Future<void> fetchAndSetProducts() async {
    final url = Uri.parse(Api.productUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var productData = responseData["data"]["Product"];
      // print(responseData["data"]["Product"]["product_name"]);
      // print(extractedData);
      List<ProductModel> loadedItems = [];

      productData.forEach((itemData) {
        loadedItems.insert(0, ProductModel.fromJson(itemData)
            // GridModel(
            //     id: itemData["id"],
            //     categoryName: itemData["category_name"],
            //     productImage: itemData["ProductImage"],
            //     productName: itemData["product_name"],
            //     productPrice: itemData["product_price"],
            //     productNote: itemData["product_note"],
            //     verified: itemData["verified"],
            //     status: itemData["status"],
            //     createdAt: itemData["created_at"],
            //     updatedAt: itemData["updated_at"])
            );
      });
      _gridItems = loadedItems;
      notifyListeners();
    } else {
      print("no  product found soory");
    }
  }

  Future<void> fetchCategoryProducts(String categoryId) async {
    final url = Uri.parse(Api.productCategoryUrl);
    final response = await http.post(url, body: {"category_id": categoryId});

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var productData = responseData["data"]["Product"];
      // print(responseData["data"]["Product"]["product_name"]);
      // print(responseData);
      List<CategoryProductModel> loadedItems = [];

      productData.forEach((itemData) {
        loadedItems.insert(0, CategoryProductModel.fromJson(itemData));
      });
      _categoriesItems = loadedItems;
      notifyListeners();
    } else {
      print("No  product found soory");
    }
  }

  Future<String> addToCart(String productId) async {
    // print(productId);
    final url = Uri.parse(Api.addToCartUrl);
    final response = await http.post(url, body: {"product_id": productId});
    final responseData = json.decode(response.body);
    print(responseData);
    if (response.statusCode == 200) {
      // print(responseData["message"]);
      return responseData["message"];
      // notifyListeners();
      // return responseData["message"];
    }
    notifyListeners();
    return responseData["message"];
  }
}
