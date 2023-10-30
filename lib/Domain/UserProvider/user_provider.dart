import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_user_class3/Data/Repositories/api_services.dart';

import '../../Data/Models/UserModel.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async {
    final response = await http.get(Uri.parse(AppUrl.ApiUri));

    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
      notifyListeners();
    }
  }
}
