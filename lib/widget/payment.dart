import "package:flutter/material.dart";
import 'package:restaurant/widget/reviewOrder.dart';

class Payment extends StatelessWidget {
  static const routeName = "payment";
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    void _CardForm() {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                contentPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Builder(
                  builder: (context) {
                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;

                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 20,
                        ),
                        height: height - 360,
                        width: width,
                        child: Column(
                          children: [
                            Text(
                              "Added a new Card",
                              style: TextStyle(
                                  color: Color.fromRGBO(67, 172, 106, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'Name on Card',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 0, bottom: 0, left: 9),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color.fromRGBO(
                                              205, 205, 205, 1))),
                                  hintText: 'Card Number',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(138, 138, 138, 0.8))),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 280,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 0, bottom: 0, left: 9),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    205, 205, 205, 1))),
                                        hintText: 'Valid Till',
                                        hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                138, 138, 138, 0.8))),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width - 240,
                                  child: const TextField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 0, bottom: 0, left: 9),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    205, 205, 205, 1))),
                                        hintText: 'CVC',
                                        hintStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                138, 138, 138, 0.8))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.06,
                            ),
                            Container(
                              height: height * 0.07,
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 172, 106, 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(ReviewOrder.routeName);
                                  },
                                  child: const Text(
                                    "Done",
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
    }

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 20),
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image(
                          image: AssetImage("assets/restaurants/cart.png"),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Choose your payment method",
                        style:
                            TextStyle(color: Color.fromRGBO(67, 172, 106, 1)),
                      )),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: width * 0.3,
                          height: height * 0.1,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.18),
                                blurRadius: 3,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/payment/credit.png")),
                              Text("Credit/Debit")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          width: width * 0.3,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.18),
                                blurRadius: 3,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/payment/master.png")),
                              Text("Visa/master card")
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: width * 0.3,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.18),
                                blurRadius: 3,
                                offset:
                                    Offset(0, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(
                                  image:
                                      AssetImage("assets/payment/rupees.png")),
                              Text("cash")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 10),
                  child: Container(
                    height: 70,
                    child: Column(
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.only(left: 0, bottom: 0),
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          leading: Icon(
                            Icons.circle_outlined,
                            color: Colors.green,
                            size: 15,
                          ),
                          title: Transform.translate(
                            offset: Offset(-25, 0),
                            child: Text("Added Address"),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(left: 0, bottom: 0, top: 0),
                          visualDensity:
                              VisualDensity(horizontal: -4, vertical: -4),
                          leading: Icon(
                            Icons.add,
                            color: Colors.green,
                            size: 15,
                          ),
                          title: Transform.translate(
                            offset: Offset(-25, 0),
                            child: Text("Added Address"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery free",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.7)),
                      ),
                      Text("Free")
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "\$ 36.90",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              height: height * 0.07,
              width: width,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(67, 172, 106, 1),
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                  onPressed: () {
                    _CardForm();
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
