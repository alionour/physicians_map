import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/authentication/signin/sign_in_view.dart';
import 'package:physicians_map/src/authentication/signup/sign_up_view.dart';
import 'package:physicians_map/src/custom_widgets/authentication_background.dart';

class ProfileViewSmallScreens extends StatelessWidget {
  const ProfileViewSmallScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthenticationBackground(
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: Get.height * 0.25,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 39,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 35,
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 31,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SignUpView.routeName);
                    },
                    child: const Text("SignUp"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SignInView.routeName);
                    },
                    child: const Text("SignIn"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
