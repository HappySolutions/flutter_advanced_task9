import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';
import 'package:flutter_advanced_task9/data/repo/posts_repo.dart';

enum PostsState { loading, success, error }

class PostsNotifier extends ChangeNotifier {
  String? _message;
  String? get message => _message;

  final List<Post> _postsList = [];
  List<Post> get postsList => _postsList;

  PostsState _postsState = PostsState.loading;
  PostsState get postsState => _postsState;

  Future<void> fetchPostsData() async {
    try {
      final response = await PostsRepo.fetchPostsData();

      if (response.isNotEmpty) {
        _postsList.addAll(response);
        _postsState = PostsState.success;
        notifyListeners();
      } else {
        log('>>>>>>>>>>>>>Error');
      }
    } catch (error) {
      _postsState = PostsState.error;
      _message = error.toString();
      notifyListeners();
    }
  }
}
