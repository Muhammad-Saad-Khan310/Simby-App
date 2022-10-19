import 'package:flutter/material.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../exceptions/http_exception.dart';

import '../url/api.dart';

class AuthProvider with ChangeNotifier {
  String? message;
  Future<bool> login(String email, String password) async {
    final url = Uri.parse(Api.signinUrl);
    try {
      final response =
          await http.post(url, body: {'email': email, 'password': password});
      final responseData = json.decode(response.body);
      print(responseData);
      message = responseData["message"];

      if (responseData["status"] == "success") {
        // return responseData["message"];
        return true;
      } else {
        throw HttpException(responseData["message"]);

        // final prefs = await SharedPreferences.getInstance();

        // final userData = json.encode({'userData': data});
        // await prefs.setString('userData', data);
        // prefs.clear();

        // print(data);
        // return responseData["message"];
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> signup(String email, String password, String firstname,
      String secondname) async {
    final url = Uri.parse(Api.sigupUrl);
    try {
      final response = await http.post(url, body: {
        'email': email,
        'password': password,
        'first_name': firstname,
        'last_name': secondname,
        "company_name": "simby",
        "phone": "9403993"
      });
      final responseData = json.decode(response.body);
      print("+________________________++");
      print(responseData);
      message = responseData["message"];

      if (responseData["status"] == "success") {
        // return responseData["message"];
        return true;
      } else {
        throw HttpException(responseData["message"]);

        // final prefs = await SharedPreferences.getInstance();

        // final userData = json.encode({'userData': data});
        // await prefs.setString('userData', data);
        // prefs.clear();

        // print(data);
        // return responseData["message"];
        return false;
      }
    } catch (error) {
      rethrow;
    }
  }
}
