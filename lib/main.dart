import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:restaurant/contact.dart';
import 'package:restaurant/provider/auth.dart';
import 'package:restaurant/provider/cartProvider.dart';
import 'package:restaurant/provider/category.dart';
import 'package:restaurant/provider/orderProvider.dart';
import 'package:restaurant/widget/Recommended.dart';
import 'package:restaurant/widget/about.dart';
import 'package:restaurant/widget/accounts.dart';
import 'package:restaurant/widget/cart.dart';
import 'package:restaurant/widget/myOrder.dart';
import 'package:restaurant/widget/farmer_interface.dart';
import 'package:restaurant/widget/forgotPassword.dart';
import 'package:restaurant/widget/item-cart.dart';
import 'package:restaurant/screens/authScreen.dart';
import 'package:restaurant/widget/orderItem.dart';
import 'package:restaurant/widget/payment.dart';
import 'package:restaurant/widget/reviewOrder.dart';
import 'package:restaurant/widget/support.dart';
import 'package:restaurant/widget/terms&condition.dart';
import './screens/categoryScreen.dart';

import './widget/home.dart';
import './widget/profile.dart';
import './widget/product.dart';
import './widget/myOrder.dart';
import 'provider/productsProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ProductProvider()),
        // ChangeNotifierProvider.value(value: ProductProvider()),
        ChangeNotifierProvider.value(value: CategoryProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: OrderProvider()),
        // ChangeNotifierProvider.value(value: CategoryProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

        // home: Auth(),
        // home: Cart(),
        // home: MyOrderList(),
        // home: ItemCart(),
        // home: Product(),
        // home: Payment(),
        // home: ReviewOrder(),
        // home: MyOrders(),

        home: Auth(),
        // home: FarmerInterface(),
        // home: RecommendedItem(),
        // home: Home(),
        // home: ForgotPassword(),
        // home: Accounts(),
        // home: About(),
        // home: Profile(),
        // home: ContactUs(),

        routes: {
          Home.routeName: (context) => const Home(),
          ProductPage.routeName: (context) => const ProductPage(),
          Cart.routeName: (context) => const Cart(),
          Payment.routeName: (context) => const Payment(),
          ReviewOrder.routeName: (context) => const ReviewOrder(),
          Profile.routeName: (context) => const Profile(),
          // MyOrders.routeName: (context) => const MyOrders(),
          MyOrderList.routeName: (context) => const MyOrderList(),
          OrderItems.routeName: (context) => const OrderItems(),
          FarmerInterface.routeName: (context) => const FarmerInterface(),
          About.routeName: (context) => const About(),
          Accounts.routeName: (context) => const Accounts(),
          TermsAndCondition.routeName: (context) => const TermsAndCondition(),
          Support.routeName: (context) => const Support(),
          ContactUs.routeName: (context) => const ContactUs(),
          ProductCategoryScreen.routeName: (context) =>
              const ProductCategoryScreen(),
        },
      ),
    );
  }
}
