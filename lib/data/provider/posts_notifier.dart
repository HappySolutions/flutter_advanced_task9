import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';
import 'package:flutter_advanced_task9/data/repo/posts_repo.dart';

enum PostsState { loading, success, error }

class PostsNotifier extends ChangeNotifier {
  PostsRepo? postsRepo;
  String? _message;
  String? get message => _message;

  final List<Post> _postsList = [];
  List<Post> get postsList => _postsList;

  PostsState _postsState = PostsState.loading;
  PostsState get postsState => _postsState;

  Future<void> fetchPostsData() async {
    try {
      final response = await postsRepo?.getPosts();
      _postsList.addAll(response?.data);
      _postsState = PostsState.success;
      notifyListeners();
    } catch (error) {
      _postsState = PostsState.error;
      _message = error.toString();
      notifyListeners();
    }
  }
}
