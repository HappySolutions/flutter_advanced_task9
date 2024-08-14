import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';
import 'package:flutter_advanced_task9/data/provider/app_notifier.dart';
import 'package:flutter_advanced_task9/widgets/posts_list_widget.dart';
import 'package:provider/provider.dart';

class CommentsPage extends StatefulWidget {
  final Post post;
  const CommentsPage({required this.post, super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    context.read<AppNotifier>().fetchCommentsData(widget.post.id ?? 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Comments'),
      ),
      body: Consumer<AppNotifier>(
        builder: (context, value, child) {
          if (value.postsState == PostsState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.postsState == PostsState.error) {
            return Center(
              child: Text(value.message.toString()),
            );
          }
          return PostsListWidget(posts: value.postsList);
        },
      ),
    );
  }
}
