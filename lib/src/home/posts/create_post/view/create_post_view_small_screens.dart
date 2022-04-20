import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePostViewSmallScreens extends StatefulWidget {
  const CreatePostViewSmallScreens({Key? key}) : super(key: key);

  @override
  _CreatePostViewSmallScreensState createState() =>
      _CreatePostViewSmallScreensState();
}

class _CreatePostViewSmallScreensState
    extends State<CreatePostViewSmallScreens> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 60,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.close_fullscreen_rounded,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Tweet")),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 200,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "What's happening?",
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          )
        ],
      ),
    );
  }
}
