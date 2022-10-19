import "package:flutter/material.dart";
import 'package:restaurant/contact.dart';
import 'package:restaurant/widget/about.dart';
import 'package:restaurant/widget/accounts.dart';
import 'package:restaurant/widget/farmer_interface.dart';
import 'package:restaurant/widget/myOrder.dart';
import 'package:restaurant/widget/orderItem.dart';
import 'package:restaurant/widget/support.dart';
import 'package:restaurant/widget/terms&condition.dart';

class Profile extends StatelessWidget {
  static const routeName = "profile";
  const Profile({super.key});

  Widget bottom_navigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Image(
          image: AssetImage("assets/restaurants/home.png"),
        ),
        Image(
          image: AssetImage("assets/restaurants/restaurants.png"),
        ),
        Image(
          image: AssetImage("assets/profile/knife.png"),
        ),
        Image(
          image: AssetImage("assets/profile/person.png"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Stack(
          children: [
            Positioned(
                top: 25,
                child: GestureDetector(
                    onTap: (() {
                      Navigator.of(context)
                          .pushNamed(FarmerInterface.routeName);
                    }),
                    child: Icon(Icons.arrow_back_ios))),
            Positioned(
              top: height * 0.09,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hello Jhon",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          "https://www.diethelmtravel.com/wp-content/uploads/2016/04/bill-gates-wealthiest-person.jpg")),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    height: height * 0.8,
                    width: width,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(Accounts.routeName);
                          },
                          child: ListTile(
                            // dense: true,
                            // contentPadding:
                            //     EdgeInsets.only(right: 0, left: 0, bottom: 0),
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -2),
                            leading: Image(
                              image: AssetImage("assets/profile/account.png"),
                            ),
                            title: Text(
                              "My Account",
                              style: TextStyle(),
                            ),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(About.routeName);
                          },
                          child: ListTile(
                            // dense: true,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -2),
                            leading: Image(
                              image: AssetImage("assets/profile/about.png"),
                            ),
                            title: Text("About Us"),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(MyOrderList.routeName);
                          },
                          child: ListTile(
                            // dense: true,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -2),
                            leading: Image(
                              image: AssetImage("assets/profile/orders.png"),
                            ),
                            title: Text("My Orders"),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(TermsAndCondition.routeName);
                          },
                          child: ListTile(
                            // dense: true,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -2),
                            leading: Image(
                              image: AssetImage("assets/profile/term.png"),
                            ),
                            title: Text("Terms & Conditions"),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(ContactUs.routeName);
                          },
                          child: ListTile(
                            // dense: true,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -2),
                            leading: Image(
                              image: AssetImage("assets/profile/contact.png"),
                            ),
                            title: Text("Contact Us"),
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pushNamed(Support.routeName);
                          }),
                          child: ListTile(
                            // dense: true,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -2),
                            leading: Image(
                              image: AssetImage("assets/profile/support.png"),
                            ),
                            title: Text("Support"),
                          ),
                        ),
                        // Divider(
                        //   height: 0,
                        // ),
                        // ListTile(
                        //   // dense: true,
                        //   visualDensity:
                        //       VisualDensity(horizontal: -4, vertical: -2),
                        //   leading: Image(
                        //     image: AssetImage("assets/profile/forgot.png"),
                        //   ),
                        //   title: Text("Forgot Password"),
                        // ),
                        Divider(
                          height: 0,
                          // indent: 0,
                          // thickness: 1,
                        ),
                        //   ListTile(
                        //     // dense: true,
                        //     visualDensity:
                        //         VisualDensity(horizontal: -4, vertical: -2),
                        //     leading: Image(
                        //       image: AssetImage("assets/profile/setting.png"),
                        //     ),
                        //     title: Text("Settings"),
                        //   ),
                        //   Divider()
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              left: width * 0.05,
              right: width * 0.05,
              bottom: 10,
              child: Container(
                height: height * 0.08,
                color: Colors.white,
                child: bottom_navigation(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
