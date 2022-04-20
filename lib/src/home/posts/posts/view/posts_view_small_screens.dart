import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/home/posts/create_post/view/create_post_view.dart';
import 'package:physicians_map/src/home/posts/posts/bloc/posts_bloc.dart';

class PostsViewSmallScreens extends StatelessWidget {
  const PostsViewSmallScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(CreatePostView.routeName);
        },
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        child: BlocProvider<PostsBloc>(
          create: (context) {
            return PostsBloc()..add(PostsStartedEvent());
          },
          child: BlocBuilder<PostsBloc, PostsState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PostsLoaded) {
                if (state.posts.isEmpty) {
                  return const Center(
                    child: Text("No Posts Available"),
                  );
                }
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          tileColor: Colors.red,
                          title: Text(state.posts.elementAt(index).title ?? ""),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: state.posts.length);
              }
              return const Text('Something went wrong!');
            },
          ),
        ),
      ),
    );
  }
}
