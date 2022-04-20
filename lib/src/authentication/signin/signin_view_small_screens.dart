import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/custom_widgets/loading_button.dart';

import '/src/authentication/signin/sign_in_controller.dart';

class SignInViewSmallScreens extends StatelessWidget {
  SignInViewSmallScreens({Key? key}) : super(key: key);
  final SignInController _signInController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Form(
          key: _signInController.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: Get.height,
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return getSignInFormFields().elementAt(index);
                },
                itemCount: getSignInFormFields().length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
          ),
        )),
      ),
    );
  }

  List<Widget> getSignInFormFields() {
    return [
      TextFormField(
        controller: _signInController.usernameController,
        focusNode: _signInController.usernameFocusNode,
        decoration: const InputDecoration(labelText: 'Username'),
        onFieldSubmitted: (String value) {
          _signInController.passwordFocusNode.requestFocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'Username can not be empty';
          }
        },
      ),
      TextFormField(
        controller: _signInController.passwordController,
        focusNode: _signInController.passwordFocusNode,
        decoration: const InputDecoration(
          labelText: 'Password',
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
        onFieldSubmitted: (String value) => _signInController.signIn(),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Password can not be empty';
          }
        },
      ),
      LoadingButton(onPressed: _signInController.signIn, text: 'SignIn')
    ];
  }
}
