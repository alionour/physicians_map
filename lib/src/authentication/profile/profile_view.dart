import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/authentication/profile/profile_view_small_screens.dart';

class ProfileView extends GetResponsiveView {
  ProfileView({Key? key}) : super(key: key);
  static const routeName = '/authentication/profile';

  @override
  Widget? phone() => const ProfileViewSmallScreens();
}
