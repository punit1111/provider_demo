import 'package:dio/dio.dart';
import 'package:provider_demo/data/model/post_model.dart';
import 'package:provider_demo/data/model/user_model.dart';

class ApiRoutes {
  static String usersPath = 'https://reqres.in/api/users';
  static String postsPath = 'https://gorest.co.in/public/v2/posts';
}

class ApiServices {
  static final _dio = Dio();

  static Future<List<UserModel>> fetchUsers() async {
    Response response = await _dio.get(ApiRoutes.usersPath);
    print(response.data.toString());
    List<UserModel> users = List<UserModel>.from(
      response.data['data'].map((x) => UserModel.fromJson(x)),
    );
    return users;
  }

  static Future<List<Post>> fetchPosts() async {
    Response response = await _dio.get(ApiRoutes.postsPath);
    print(response.data.toString());
    List<Post> posts = List<Post>.from(
      response.data.map((x) => Post.fromJson(x)),
    );
    return posts;
  }
}
