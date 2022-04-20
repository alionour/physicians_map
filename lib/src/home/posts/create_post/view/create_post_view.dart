import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/home/posts/create_post/view/create_post_view_small_screens.dart';

class CreatePostView extends GetResponsiveView {
  CreatePostView({Key? key}) : super(key: key);
  static const routeName = "/posts/create_post";
  @override
  Widget? phone() => const CreatePostViewSmallScreens();
}
