import 'package:flutter/material.dart';
import 'package:flutter_advanced_task9/data/provider/posts_notifier.dart';
import 'package:flutter_advanced_task9/widgets/posts_list_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Posts Page')),
      ),
      body: Consumer<PostsNotifier>(
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
      // BlocBuilder<PostsBloc, PostsState>(
      //   builder: (context, state) {
      //     if (state is PostsLoadingState) {
      //       return const Center(child: CircularProgressIndicator());
      //     }
      //     if (state is PostsLoadedState) {
      //       return PostsListWidget(posts: state.posts);
      //     }
      //     if (state is PostsEmptyState) {
      //       return const Center(
      //         child: Text('No posts found'),
      //       );
      //     }
      //     if (state is PostsLoadingErrorState) {
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const Icon(
      //               Icons.network_check_rounded,
      //               color: Colors.blueAccent,
      //               size: 40.0,
      //             ),
      //             const SizedBox(
      //               height: 20.0,
      //             ),
      //             Text(state.errorMessage),
      //           ],
      //         ),
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),
    );
  }
}
