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
          if (value.commentsState == CommentsState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.commentsState == CommentsState.error) {
            return Center(
              child: Text(value.message.toString()),
            );
          }
          return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final comment = value.commentsList[index];
                return InkWell(
                  onTap: () {
                    // showModalBottomSheet(
                    //   isScrollControlled: true,
                    //   context: context,
                    //   builder: (context) {
                    //     return Padding(
                    //         padding: MediaQuery.of(context).viewInsets,
                    //         child: PostPreview(post: post));
                    //   },
                    // );
                  },
                  child: Container(
                    height: 150,
                    // width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          comment.name ?? 'No title',
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          comment.body ?? 'No Text',
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemCount: value.commentsList.length);
        },
      ),
    );
  }
}
