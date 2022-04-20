import 'package:flutter/material.dart';

class LoadingButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final Function(bool isLoading)? changeLoadingState;
  const LoadingButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.changeLoadingState})
      : super(key: key);

  @override
  _LoadingButtonState createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          )
        : ElevatedButton(
            child: Text(widget.text),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              await widget.onPressed();
              setState(() {
                isLoading = false;
              });
            },
          );
  }
}
