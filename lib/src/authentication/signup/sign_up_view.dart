import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/authentication/signup/sign_up_controller.dart';
import 'package:physicians_map/src/authentication/signup/signup_view_small_screens.dart';

class SignUpView extends GetResponsiveView {
  SignUpView({Key? key}) : super(key: key);
  final SignUpController _signUpController = Get.put(SignUpController());
  static const routeName = '/authentication/signup';
  @override
  Widget? phone() => SignUpViewSmallScreens();
}
