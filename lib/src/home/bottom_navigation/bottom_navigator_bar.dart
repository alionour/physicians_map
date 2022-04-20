import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physicians_map/src/home/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigatorBar extends StatefulWidget {
  const CustomBottomNavigatorBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigatorBarState createState() =>
      _CustomBottomNavigatorBarState();
}

class _CustomBottomNavigatorBarState extends State<CustomBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    BottomNavigationBloc bottomNavigationBloc =
        BlocProvider.of<BottomNavigationBloc>(context);
    return BlocProvider<BottomNavigationBloc>(
      create: (BuildContext context) => bottomNavigationBloc,
      child: BlocBuilder<BottomNavigationBloc, BottomNavagationState>(
        builder: (context, state) {
          print("state $state");
          print(
              "state ${Provider.of<BottomNavigationBloc>(context).currentIndex}");
          return BottomNavigationBar(
            onTap: Provider.of<BottomNavigationBloc>(context).navigate,
            currentIndex:
                Provider.of<BottomNavigationBloc>(context).currentIndex,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Map',
                icon: Icon(
                  Icons.map_rounded,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.person_pin_rounded,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
