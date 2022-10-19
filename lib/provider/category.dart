import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../model/categoryModel.dart';
import 'package:http/http.dart' as http;

import '../url/api.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _categoryItems = [];

  List<CategoryModel> get categoriesItem {
    return [..._categoryItems];
  }

  Future<void> fetchAndSetsCategory() async {
    final url = Uri.parse(Api.categoryUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var responseData = json.decode(response.body);
      var categoryData = responseData["data"]["Category"];
      List<CategoryModel> loadedItems = [];
      categoryData.forEach((itemData) {
        loadedItems.insert(0, CategoryModel.fromJson(itemData)
            // CategoryModel(
            //     id: itemData['id'],
            //     categoryImage: itemData['CategoryImage'],
            //     name: itemData["name"],
            //     description: itemData["description"],
            //     status: itemData["status"],
            //     createdAt: DateTime.parse(itemData["created_at"]),
            //     updatedAt: DateTime.parse(itemData["updated_at"]))
            );
      });
      _categoryItems = loadedItems;
      notifyListeners();
    }
  }
}
