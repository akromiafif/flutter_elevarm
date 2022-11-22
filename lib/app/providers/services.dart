import 'dart:convert';

import 'package:flutter_elevarm/app/data/models/user.dart';
import 'package:http/http.dart' as http;

class ServiceProvider {
  static var client = http.Client();
  static var BASE_URL = 'http://10.0.2.2:8080';

  Future<User?> login(String username, String password) async {
    var response = await http.post(
      Uri.parse('$BASE_URL/users/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return userFromJson(json.encode(data["result"]));
    } else {
      return null;
    }
  }

  Future<User?> signUp(String username, String email, String password) async {
    var response = await http.post(
      Uri.parse('$BASE_URL/users/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      return userFromJson(json.encode(data["result"]));
    } else {
      return null;
    }
  }
}
