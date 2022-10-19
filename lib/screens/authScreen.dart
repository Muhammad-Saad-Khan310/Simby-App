import "package:flutter/material.dart";
import "package:provider/provider.dart";
import 'package:restaurant/exceptions/http_exception.dart';
import 'package:restaurant/provider/auth.dart';
import 'package:restaurant/widget/about.dart';

import 'package:restaurant/widget/home.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  int _value = 1;
  var _email = "";
  var _password = "";
  var _confirmPassword = "";
  var _firstName = "";
  var _secondName = "";

  bool _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    try {
      setState(() {
        _isLoading = true;
      });
      if (_isLogin) {
        await Provider.of<AuthProvider>(context, listen: false)
            .login(_email, _password)
            .then((value) {
          if (value) {
            setState(() {
              _isLoading = false;
            });
            Navigator.of(context).pushNamed(Home.routeName);
          }
        });
      } else {
        await Provider.of<AuthProvider>(context, listen: false)
            .signup(_email, _password, _firstName, _secondName)
            .then((value) {
          setState(() {
            _isLoading = false;
          });
          Navigator.of(context).pushNamed(Home.routeName);
        });
      }
    } on HttpException catch (error) {
      setState(() {
        _isLoading = false;
      });

      // final snackBar = SnackBar(
      //   content: Text(error.toString()),
      // );
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Alert"),
          content: Text(error.toString()),
          actions: [
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }

    // if (isAllowed) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   Navigator.of(context).pushNamed(Home.routeName);
    // } else {
    //   setState(() {
    //     _isLoading = false;
    //   });
    //   final snackBar = SnackBar(
    //     content: Text(authData.message!),
    //   );
    //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

    //   // print(authData.message);
    // }
  }

  InputDecoration FieldDecoration(
      double width, double height, String fieldName, String imageUrl) {
    return InputDecoration(
        prefixIcon: Image(
          image: AssetImage(
            imageUrl,
          ),
          width: width * 0.01,
          height: height * 0.01,
        ),
        contentPadding: const EdgeInsets.only(top: 0, bottom: 0, left: 00),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(205, 205, 205, 1))),
        hintText: fieldName,
        hintStyle: const TextStyle(color: Color.fromRGBO(138, 138, 138, 0.8)));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
          // width: width,
          // height: ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios))),
                  _isLogin
                      ? const Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(30, 30, 30, 1)),
                        )
                      : const Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(30, 30, 30, 1)),
                        ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text("Welcome Back to",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(30, 30, 30, 1))),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text("SIMBY",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(67, 172, 106, 1))),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 45, right: 45),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam ",
                      style: TextStyle(
                          color: Color.fromRGBO(102, 102, 102, 1),
                          fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  _isLogin
                      ? Container()
                      : Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Text(
                            "Please enter your details to sign up",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width * 0.15, right: width * 0.15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          if (!_isLogin)
                            TextFormField(
                              decoration: FieldDecoration(width, height,
                                  "First Name", "assets/auth/person.png"),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter first name";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _firstName = newValue!;
                              },
                            ),
                          if (!_isLogin)
                            SizedBox(
                              height: height * 0.01,
                            ),
                          if (!_isLogin)
                            TextFormField(
                              decoration: FieldDecoration(width, height,
                                  "Last Name", "assets/auth/person.png"),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter second name";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _secondName = newValue!;
                              },
                            ),
                          if (!_isLogin)
                            SizedBox(
                              height: height * 0.01,
                            ),
                          if (_isLogin)
                            SizedBox(
                              height: height * 0.1,
                            ),
                          TextFormField(
                            decoration: FieldDecoration(width, height, "Email",
                                "assets/auth/email.png"),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter email";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _email = newValue!;
                            },
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: FieldDecoration(width, height,
                                "Password", "assets/auth/password.png"),
                            // textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _password = newValue!;
                            },
                          ),
                          if (!_isLogin)
                            SizedBox(
                              height: height * 0.01,
                            ),
                          if (!_isLogin)
                            TextFormField(
                              obscureText: true,
                              decoration: FieldDecoration(
                                  width,
                                  height,
                                  "Confirm Password",
                                  "assets/auth/password.png"),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter confirm password";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                _confirmPassword = newValue!;
                              },
                            ),
                          if (!_isLogin)
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                const Text("Farmer"),
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                const Text("Restaurant")
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                  if (_isLogin)
                    SizedBox(
                      height: height * 0.03,
                    ),
                  if (_isLogin)
                    const Text(
                      "Forgot your password?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  if (_isLogin)
                    SizedBox(
                      height: height * 0.02,
                    ),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(width * 0.44, 50),
                            primary: const Color.fromRGBO(67, 172, 106, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            // _submit();
                            Navigator.of(context).pushNamed(Home.routeName);
                          },
                          child: _isLogin
                              ? const Text("Login")
                              : const Text("Sign up")),

                  SizedBox(
                    height: height * 0.02,
                  ),
                  //
                ],
              ),
              if (_isLogin)
                SizedBox(
                  height: height * 0.14,
                ),
              if (!_isLogin)
                SizedBox(
                  height: height * 0.03,
                ),
              _isLogin
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                              color: Color.fromRGBO(114, 114, 114, 1)),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = false;
                              });
                            },
                            child: const Text("Register")),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: Color.fromRGBO(114, 114, 114, 1)),
                        ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLogin = true;
                              });
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Colors.blue),
                            ))
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
