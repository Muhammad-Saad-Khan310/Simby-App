import "package:flutter/material.dart";

class Accounts extends StatelessWidget {
  static const routeName = "account-page";
  const Accounts({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 15),
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
              "My Account",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(30, 30, 30, 1)),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.15, right: width * 0.15),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: "Name",
                    decoration: InputDecoration(
                      prefixIcon: Image(
                        image: AssetImage(
                          "assets/auth/person.png",
                        ),
                        width: width * 0.01,
                        height: height * 0.01,
                      ),
                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 00),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(205, 205, 205, 1))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    initialValue: 'Last Name',
                    // style: TextStyle(color: Color.fromRGBO(138, 138, 138, 0.8)),
                    decoration: InputDecoration(
                      prefixIcon: Image(
                        image: AssetImage(
                          "assets/auth/person.png",
                        ),
                        width: width * 0.01,
                        height: height * 0.01,
                      ),
                      contentPadding:
                          EdgeInsets.only(top: 0, bottom: 0, left: 00),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(205, 205, 205, 1))),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    initialValue: "user@gmail.com",
                    decoration: InputDecoration(
                        prefixIcon: Image(
                          image: AssetImage("assets/auth/email.png"),
                          width: width * 0.01,
                          height: height * 0.01,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(205, 205, 205, 1))),
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(138, 138, 138, 0.8))),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    initialValue: "passwordText",
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Image(
                          image: AssetImage(
                            "assets/auth/password.png",
                          ),
                          width: width * 0.01,
                          height: height * 0.01,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Colors.grey,
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 0, bottom: 0, left: 00),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(205, 205, 205, 1))),
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(138, 138, 138, 0.8))),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.44, 50),
                        primary: Color.fromRGBO(67, 172, 106, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Submit")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
