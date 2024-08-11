import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 150,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.title ?? 'No title',
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10.0),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            post.body ?? 'No Text',
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
