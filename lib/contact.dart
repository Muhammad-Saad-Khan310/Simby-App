import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  static const routeName = "contact-us";
  const ContactUs({super.key});

  Widget AllField(double width, double height, String fieldName) {
    return TextField(
      decoration: InputDecoration(

          // contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 00),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(205, 205, 205, 1))),
          hintText: fieldName,
          hintStyle:
              const TextStyle(color: Color.fromRGBO(138, 138, 138, 0.8))),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: width,
            padding: const EdgeInsets.only(left: 15, right: 15, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: Text(
                  "Contact Us",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: height * 0.03,
                ),
                const Text("Business name"),
                SizedBox(
                  height: height * 0.01,
                ),
                AllField(width, height, "Business name"),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("City or cities of operation"),
                SizedBox(
                  height: height * 0.01,
                ),
                AllField(width, height, "City or cities of operation"),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Phone number"),
                SizedBox(
                  height: height * 0.01,
                ),
                AllField(width, height, "Phone number"),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text("Email"),
                SizedBox(
                  height: height * 0.01,
                ),
                AllField(width, height, "Email"),
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(width * 0.44, 50),
                        primary: Color.fromRGBO(67, 172, 106, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Send")),
                ),
              ],
            )),
      ),
    );
  }
}
