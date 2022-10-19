import "package:flutter/material.dart";
import "package:provider/provider.dart";

import '../provider/productsProvider.dart';
import '../widget/RecommendGrid.dart';

class ProductCategoryScreen extends StatefulWidget {
  static const routeName = "category_product";
  const ProductCategoryScreen({super.key});

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  var _isInit = true;

  @override
  void didChangeDependencies() async {
    var categoryId = ModalRoute.of(context)!.settings.arguments as String;

    await Provider.of<ProductProvider>(context)
        .fetchCategoryProducts(categoryId);
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context).categoryItems;
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: productData.length,
          itemBuilder: ((context, i) {
            return GridItem(
                id: productData[i].id,
                imageUrl: "assets/restaurants/apple.png",
                title: productData[i].productName);
          }),
        ),
      ),
    );
  }
}
