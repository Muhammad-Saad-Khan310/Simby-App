import "package:flutter/material.dart";

class Support extends StatelessWidget {
  static const routeName = "Support";
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 35, left: 15, right: 15),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.arrow_back_ios))),
              Text(
                "Support",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ",
                  style: TextStyle(
                      color: Color.fromRGBO(102, 102, 102, 1), fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
