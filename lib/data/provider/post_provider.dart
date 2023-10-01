import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider_demo/data/config/api_routes.dart';
import 'package:provider_demo/data/model/post_model.dart';
import 'package:provider_demo/data/model/user_model.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _postList = <Post>[];

  List<Post> get posts => _postList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchPosts() async {
    _isLoading = true;
    _postList = await ApiServices.fetchPosts();
    _isLoading = false;
    notifyListeners();
  }
}
