import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ta/components/MainNavigation.dart';
import 'package:ta/core/model/user_model.dart';
import 'package:ta/core/session/user_storage.dart';
import 'package:ta/screen/Seller/components/sellerNavigation.dart';
import 'package:ta/screen/startpage.dart';

class SessionManager {
  static Future<SharedPreferences> instance = SharedPreferences.getInstance();
  static void initialize(BuildContext context) async {
    var pref = await instance;
    var data = pref.getString("user");
    var dataAuthorization = pref.getString("authorization");
    if (data != null && dataAuthorization != null) {
      var user = jsonDecode(data);
      var authorization = jsonDecode(dataAuthorization);
      storage.user = User.fromJson(user);
      storage.authorization = Authorization.fromJson(authorization);
      if (storage.user != null) {
        if (storage.user?.id == 1) {
          /// Seller
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => SellerNavigation(token: storage.user!.id)));
        } else {
          /// Buyer
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => MainNavigation(token: storage.user!.id)));
        }
      }
    }
  }

  static addSession() async {
    var pref = await instance;
    var userToMap = storage.user?.toJson();
    var authorizationToMap = storage.user?.toJson();
    pref.setString("user", jsonEncode(userToMap));
    pref.setString("authorization", jsonEncode(authorizationToMap));
  }

  static void clearSession(BuildContext context) async {
    var pref = await instance;
    pref.clear();
    storage.user = null;
    storage.authorization = null;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => StartPage()));
  }
}
