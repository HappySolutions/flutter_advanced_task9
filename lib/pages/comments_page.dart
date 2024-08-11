import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';

class CommentsPage extends StatefulWidget {
  final Post post;
  const CommentsPage({required this.post, super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  @override
  void initState() {
    // context.read<CommentsBloc>().add(GetCommentsEvent(widget.post.id ?? 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Comments'),
      ),
      body: const SizedBox(),
    );
  }
}
