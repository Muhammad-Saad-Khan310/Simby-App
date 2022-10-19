import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/cartProvider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height * 0.4,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: ((ctx, i) {
            return CartItemWidget(
              title: "sfksj",
              price: "48",
              image: "assets/cart/banana.png",
            );
          })),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  // const CartItemWidget({super.key});
  final String title;
  final String price;
  final String image;
  CartItemWidget(
      {required this.image, required this.price, required this.title});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Future<void> removeCartProduct() async {
      Provider.of<CartProvider>(context, listen: false)
          .removeCartProduct()
          .then((value) {
        final snackBar = SnackBar(
          content: Text(value),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    Future<void> updateCartProduct() async {
      Provider.of<CartProvider>(context, listen: false)
          .updateCartProduct()
          .then((value) {
        final snackBar = SnackBar(
          content: Text(value),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: width,
      height: height * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.18),
            // blurRadius: 10,
            blurRadius: 5,
            offset: Offset(0, 7), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 90,
            top: 5,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(price)
              ],
            ),
          ),
          Positioned(
            top: 15,
            left: 10,
            child: Image(
              image: AssetImage(image),
            ),
          ),
          Positioned(
              bottom: 5,
              right: 10,
              left: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "without salad please",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  IconButton(
                      onPressed: () {
                        updateCartProduct();
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        removeCartProduct();
                      },
                      icon: Icon(Icons.delete)),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Color.fromRGBO(248, 248, 248, 1),
                        child: Image(
                            image: AssetImage("assets/product/minus.png")),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text("1"),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 10,
                        ),
                      )
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
