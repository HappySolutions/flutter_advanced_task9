import 'package:dio/dio.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';
import 'package:flutter_advanced_task9/services/dio_service.dart';

abstract class PostsRepo {
  static Future<List<Post>> fetchPostsData() async {
    try {
      final response = await DioService.dio.get("posts");

      if (response.statusCode == 200) {
        var posts = List<Post>.from(response.data.map((e) => Post.fromJson(e)));
        return posts;
      } else {
        throw "Error Loading Posts";
      }
    } on DioException catch (error) {
      throw Exception(error);
    }
  }
}
