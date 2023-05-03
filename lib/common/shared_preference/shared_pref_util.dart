import 'dart:convert';

import 'package:ecommerce_app/features/auth/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static final String _tokenKey = "token";
  static final String _userKey = "user";

  static Future<void> saveUser(User user) async {
    final sharedPref = await SharedPreferences.getInstance();
    final _mapuser = user.toMap();
    final _encodedUser = json.encode(_mapuser);
    sharedPref.setString(_userKey, _encodedUser);
  }

  static Future<User?> getUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    final String? _encodedUser = sharedPref.getString(_userKey);
    if (_encodedUser != null) {
      Map<String, dynamic> mapUser =
          Map<String, dynamic>.from(json.decode(_encodedUser));
      return User.fromMap(mapUser);
    } else {
      return null;
    }
  }

  static Future<void> deleteUser() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(_userKey);
  }

  static Future<void> saveToken(String token) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(_tokenKey);
  }

  static Future<void> deleteToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove(_tokenKey);
  }
}
