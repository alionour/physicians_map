import 'package:flutter/material.dart';
import 'package:physicians_map/src/app_bar/app_bar.dart';
import 'package:physicians_map/src/globals.dart';
import 'package:physicians_map/src/home/posts/posts/view/posts_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exit(context);
      },
      child: Scaffold(
        appBar: CustomAppBar(
          titleText: 'Home',
        ),
        body: Center(
          child: PostsView(),
        ),
      ),
    );
  }
}
