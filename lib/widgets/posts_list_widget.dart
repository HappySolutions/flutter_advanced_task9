import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/components/post_card.dart';
import 'package:flutter_advanced_task9/components/post_preview.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostsListWidget({
    required this.posts,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          final post = posts[index];
          return InkWell(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Padding(
                      padding: MediaQuery.of(context).viewInsets,
                      child: PostPreview(post: post));
                },
              );
            },
            child: PostCard(post: post),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
        itemCount: posts.length);
  }
}
