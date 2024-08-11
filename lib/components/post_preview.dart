import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/models/post.dart';

class PostPreview extends StatelessWidget {
  final Post post;

  const PostPreview({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.45,
      width: size.width,
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Post Title: ',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
          Text(
            post.title ?? 'No title',
            style: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
          const Divider(),
          const Text(
            'Post body: ',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            post.body ?? 'No text',
            style: const TextStyle(fontSize: 10.0, height: 1.5),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => CommentsPage(
              //               post: post,
              //             )));
            },
            child: const Text('Show Comments',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
