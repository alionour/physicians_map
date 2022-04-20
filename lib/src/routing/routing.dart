import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physicians_map/src/authentication/profile/profile_view.dart';
import 'package:physicians_map/src/authentication/signin/sign_in_view.dart';
import 'package:physicians_map/src/authentication/signup/sign_up_view.dart';
import 'package:physicians_map/src/home/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'package:physicians_map/src/home/posts/create_post/view/create_post_view.dart';
import 'package:physicians_map/src/landing/landing_view.dart';

class AppRouter {
  static Route<dynamic>? onRouteGeneration(RouteSettings settings) {
    final Map<String, dynamic>? args =
        settings.arguments as Map<String, dynamic>?;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider<BottomNavigationBloc>(
                create: (BuildContext context) => BottomNavigationBloc(),
                child: const LandingView()));
      case '/authentication/signin':
        return MaterialPageRoute(builder: (context) => SignInView());
      case '/authentication/signup':
        return MaterialPageRoute(builder: (context) => SignUpView());
      case '/authentication/profile':
        return MaterialPageRoute(builder: (context) => ProfileView());
      case '/posts/create_post':
        return MaterialPageRoute(builder: (context) => CreatePostView());
      default:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<BottomNavigationBloc>(
                create: (BuildContext context) => BottomNavigationBloc(),
                child: const LandingView()));
    }
  }
}
