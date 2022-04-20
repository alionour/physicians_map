import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physicians_map/src/authentication/profile/profile_view.dart';
import 'package:physicians_map/src/home/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:physicians_map/src/home/bottom_navigation/bottom_navigator_bar.dart';
import 'package:physicians_map/src/home/home_view.dart';
import 'package:physicians_map/src/map/map_view.dart';

final List<Widget> pages = <Widget>[const HomeView(), MapView(), ProfileView()];

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);
  static const routerName = '/';

  @override
  Widget build(BuildContext context) {
    BottomNavigationBloc bottomNavigationBloc =
        BlocProvider.of<BottomNavigationBloc>(context);
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: const CustomBottomNavigatorBar(),
        body: BlocBuilder<BottomNavigationBloc, BottomNavagationState>(
          builder: (context, state) {
            print("here");
            print(bottomNavigationBloc.currentIndex);
            return pages.elementAt(bottomNavigationBloc.currentIndex);
          },
        ),
      ),
    );
  }
}
