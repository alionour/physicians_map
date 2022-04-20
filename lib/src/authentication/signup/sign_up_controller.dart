import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:physicians_map/src/api_helper/api_helper.dart';
import 'package:physicians_map/src/globals.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode middleNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode mailFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  RxBool agreedToTerms = false.obs;
  Future<void> signUp() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        Uri uri = APIHelper.signUp;
        Map<String, dynamic> queryBody = {
          'firstName': firstNameController.text,
          'lastName': lastNameController.text,
          'middleName': middleNameController.text,
          'username': usernameController.text,
          'email': mailController.text,
          'password': passwordController.text
        };
        await post(uri,
            body: json.encode(queryBody),
            headers: {'Content-Type': 'application/json'}).then((value) {
          print(value.statusCode);
          print(value.body);
          // print(json.decode(value.body)['message']['message']);
          Map<String, dynamic> responseBody = json.decode(value.body);
          if (value.statusCode == 200) {
            showCustomSnackBar('You have registered succesfully');
            return;
          } else if (value.statusCode == 422) {
            if (responseBody.containsKey('username')) {
              switch (responseBody['username']) {
                case "Is already taken.":
                  isUsernameTaken.value = true;
                  formKey.currentState?.validate();
                  break;
                default:
              }
            }
            if (responseBody.containsKey('email')) {
              switch (responseBody['email']) {
                case "Is already taken.":
                  isEmailTaken.value = true;
                  formKey.currentState?.validate();
                  break;
                default:
              }
            }
          }
        });
      } else {
        showCustomSnackBar('Complete all required fields');
        return;
      }
    } on AlreadyTakenUsernameException catch (e) {
      showCustomSnackBar(e.message);
    } on AlreadyTakenEmailException catch (e) {
      showCustomSnackBar(e.message);
    }
  }

  RxBool isUsernameTaken = false.obs;
  RxBool isEmailTaken = false.obs;
}

class AlreadyTakenUsernameException implements Exception {
  final String message;
  AlreadyTakenUsernameException(
      [this.message = 'This Username is not available']);
  @override
  String toString() {
    return 'AlreadyTakenException: Username is already taken';
  }
}

class AlreadyTakenEmailException implements Exception {
  final String message;
  AlreadyTakenEmailException([this.message = 'This Email is not available']);
  @override
  String toString() {
    return 'AlreadyTakenException: Email is already taken';
  }
}
