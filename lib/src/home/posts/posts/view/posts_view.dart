import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/home/posts/posts/view/posts_view_small_screens.dart';

class PostsView extends GetResponsiveView {
  PostsView({Key? key}) : super(key: key);
  @override
  Widget? phone() => const PostsViewSmallScreens();
}
