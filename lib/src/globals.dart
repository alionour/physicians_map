import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:physicians_map/src/authentication/signin/user_model.dart';

final Logger logger = Logger();

final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
late AuthenticationModel authenticationModel;
late String? accessToken;

bool isDesktop() {
  // return false;
  return (Platform.isWindows || Platform.isMacOS || Platform.isLinux);
}

bool isMobile() {
  // return true;
  return (Platform.isAndroid || Platform.isIOS);
}

Future<bool> exit(BuildContext context) async {
  return (isDesktop() || isMobile())
      ? (await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Warning'),
              content: const Text('Do you want to exit ?'),
              actions: [
                OverflowBar(
                  children: [
                    TextButton(
                      child: const Text('Exit'),
                      onPressed: () => SystemNavigator.pop(),
                    ),
                    TextButton(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.pop(context, false),
                    ),
                  ],
                ),
              ],
            ),
          ) ??
          false)
      : false;
}

void showCustomSnackBar(String message) {
  scaffoldMessengerKey?.currentState?.showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
    ),
  );
}
