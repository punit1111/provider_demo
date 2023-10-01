import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider_demo/data/config/api_routes.dart';
import 'package:provider_demo/data/model/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _userList = <UserModel>[];

  List<UserModel> get users => _userList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _userList = await ApiServices.fetchUsers();
    _isLoading = false;
    notifyListeners();
  }
}
