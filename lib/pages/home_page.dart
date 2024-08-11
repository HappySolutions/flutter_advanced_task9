import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/provider/app_notifier.dart';
import 'package:flutter_advanced_task9/widgets/posts_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Posts Page')),
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
