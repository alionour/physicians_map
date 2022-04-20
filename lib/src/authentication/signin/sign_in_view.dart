import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/authentication/signin/sign_in_controller.dart';
import 'package:physicians_map/src/authentication/signin/signin_view_small_screens.dart';

class SignInView extends GetResponsiveView {
  SignInView({Key? key}) : super(key: key);
  final SignInController _signInController = Get.put(SignInController());
  static const routeName = '/authentication/signin';
  @override
  Widget? phone() => SignInViewSmallScreens();
}
