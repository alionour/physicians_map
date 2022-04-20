import 'package:flutter/material.dart';

class AuthenticationBackground extends StatelessWidget {
  final Widget child;
  const AuthenticationBackground({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: Colors.deepPurple,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ],
        ),
        child,
      ],
    );
  }
}
