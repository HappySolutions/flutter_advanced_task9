import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';
import 'package:flutter_advanced_task9/data/models/comment.dart';
import 'package:flutter_advanced_task9/data/repo/app_repo.dart';

enum PostsState { loading, success, error }

enum CommentsState { loading, success, error }

class AppNotifier extends ChangeNotifier {
  String? _message;
  String? get message => _message;

  final List<Post> _postsList = [];
  List<Post> get postsList => _postsList;

  PostsState _postsState = PostsState.loading;
  PostsState get postsState => _postsState;

  Future<void> fetchPostsData() async {
    try {
      final response = await AppRepo.fetchPostsData();

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

  final List<Comment> _commentsList = [];
  List<Comment> get commentsList => _commentsList;

  CommentsState _commentsState = CommentsState.loading;
  CommentsState get commentsState => _commentsState;

  Future<void> fetchCommentsData(int postId) async {
    try {
      final response = await AppRepo.fetchCommentsData(postId);

      if (response.isNotEmpty) {
        _commentsList.addAll(response);
        _commentsState = CommentsState.success;
        notifyListeners();
      } else {
        log('>>>>>>>>>>>>>Error');
      }
    } catch (error) {
      _commentsState = CommentsState.error;
      _message = error.toString();
      notifyListeners();
    }
  }
}
