import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:physicians_map/src/api_helper/api_helper.dart';
import 'package:physicians_map/src/authentication/signin/user_model.dart';
import 'package:physicians_map/src/globals.dart';
import 'package:physicians_map/src/landing/landing_view.dart';

class SignInController extends GetxController {
  final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // number of method calls to be displayed
        errorMethodCount: 8, // number of method calls if stacktrace is provided
        lineLength: 120, // width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
        ),
  );
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  GetStorage authBox = GetStorage('auth');
  Future<AuthenticationModel?> signIn() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        await Future.delayed(const Duration(seconds: 2));
        Uri uri = APIHelper.signIn;
        Map<String, dynamic> queryBody = {
          'username': usernameController.text,
          'password': passwordController.text
        };
        await post(uri,
            body: json.encode(queryBody),
            headers: {'Content-Type': 'application/json'}).then((value) {
          logger.i(value.statusCode);
          logger.i(value.body);
          // print(json.decode(value.body)['message']['message']);
          Map<String, dynamic> responseBody = json.decode(value.body);
          if (value.statusCode == 200) {
            AuthenticationModel authModel =
                AuthenticationModel.fromJson(responseBody);
            authBox.write('loginState', true);
            authBox.write('authModel', authModel.toJson());
            Get.toNamed(LandingView.routerName);
            showCustomSnackBar('You have logged in succesfully');
            return authModel;
          } else if (value.statusCode == 401) {
            showCustomSnackBar('Invalid Credentials');
          }
        });
      } else {
        showCustomSnackBar('Complete all required fields');
      }
    } on SocketException {
      showCustomSnackBar('Failed to connect to the server.');
    }
  }
}
