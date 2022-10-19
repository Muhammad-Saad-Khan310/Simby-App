import "package:flutter/material.dart";

class FarmerInterface extends StatelessWidget {
  static const routeName = "farmerinterface";
  const FarmerInterface({super.key});

  Widget containerWidget(height, width, Color clr, String first, String second,
      String firstDetail, String secondDetail) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: height * 0.06,
      decoration: BoxDecoration(
          color: clr,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      // padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(first, style: TextStyle(color: Colors.white, fontSize: 13)),
              Text(firstDetail,
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                second,
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Text(secondDetail,
                  style: TextStyle(color: Colors.white, fontSize: 13))
            ],
          )
        ],
      ),
    );
  }

  Widget containerWidget2(height, width, String first, String second,
      String firstDetail, String secondDetail) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: height * 0.06,
      // decoration: BoxDecoration(
      //     // borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
      //     // color: clr,
      //     border: Border.all(color: Colors.black)),
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Color.fromRGBO(195, 195, 195, 1)),
              left: BorderSide(color: Color.fromRGBO(195, 195, 195, 1)),
              right: BorderSide(color: Color.fromRGBO(195, 195, 195, 1)))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(first, style: TextStyle(color: Colors.black, fontSize: 13)),
              Text(firstDetail,
                  style: TextStyle(color: Colors.black, fontSize: 13))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                second,
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              Text(secondDetail,
                  style: TextStyle(color: Colors.black, fontSize: 13))
            ],
          )
        ],
      ),
    );
  }

  Widget containerWidget3(height, width, String first, String second,
      String firstDetail, String secondDetail) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      height: height * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
        border: Border.all(color: Color.fromRGBO(195, 195, 195, 1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(first, style: TextStyle(color: Colors.black, fontSize: 13)),
              Text(firstDetail,
                  style: TextStyle(color: Colors.black, fontSize: 13))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                second,
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
              Text(secondDetail,
                  style: TextStyle(color: Colors.black, fontSize: 13))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image(
                          image:
                              AssetImage("assets/restaurants/drawerIcon.png"))),
                  Text(
                    "Orders",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.search))
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),

              // button parts

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: width * 0.3,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border:
                          Border.all(color: Color.fromRGBO(67, 172, 106, 1)),
                    ),
                    child: Center(
                        child: Text(
                      "New",
                      style: TextStyle(color: Color.fromRGBO(25, 172, 102, 1)),
                    )),
                  ),
                  Container(
                    width: width * 0.3,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(250, 152, 80, 1)),
                    child: Center(
                        child: Text(
                      "Ongoing",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                  Container(
                    width: width * 0.3,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color.fromRGBO(255, 102, 102, 1)),
                    child: Center(
                        child: Text(
                      "QR Order",
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.03,
              ),
              containerWidget(height, width, Colors.black, "first", "second",
                  "firstDetail", "secondDetail"),
              containerWidget2(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              containerWidget3(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              SizedBox(
                height: height * 0.02,
              ),
              containerWidget(height, width, Colors.black, "first", "second",
                  "firstDetail", "secondDetail"),
              containerWidget2(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              containerWidget2(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              containerWidget2(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              containerWidget3(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              SizedBox(
                height: height * 0.02,
              ),
              containerWidget(height, width, Colors.black, "first", "second",
                  "firstDetail", "secondDetail"),
              containerWidget2(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              containerWidget2(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
              containerWidget3(height, width, "first", "second", "firstDetail",
                  "secondDetail"),
            ],
          ),
        ),
      ),
    );
  }
}
