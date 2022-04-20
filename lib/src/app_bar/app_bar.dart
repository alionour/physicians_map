import 'package:flutter/material.dart';
import 'package:physicians_map/src/globals.dart';

class CustomSliverAppBar extends StatefulWidget {
  final String title;
  const CustomSliverAppBar({Key? key, required this.title}) : super(key: key);

  @override
  _CustomSliverAppBarState createState() => _CustomSliverAppBarState();
}

class _CustomSliverAppBarState extends State<CustomSliverAppBar> {
  @override
  Widget build(BuildContext context) {
    return isDesktop()
        ? const SliverToBoxAdapter()
        : SliverAppBar(
            title: Text(widget.title),
            floating: true,
            pinned: true,
            snap: true,
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ],
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(
                color: Colors.deepPurple,
              ),
            ),
            expandedHeight: 50,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          );
  }
}

class CustomAppBar extends AppBar {
  final String titleText;
  final List<Widget>? customActions;
  final Widget? customLeading;
  CustomAppBar(
      {Key? key,
      required this.titleText,
      this.customActions,
      this.customLeading})
      : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return isDesktop()
        ? const SizedBox()
        : AppBar(
            title: Text(widget.titleText),
            leading: widget.customLeading,
            actions: widget.customActions ??
                [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      exit(context);
                      // Navigator.of(context).pop();
                    },
                  ),
                ],
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Container(color: Colors.deepPurple),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          );
  }
}
