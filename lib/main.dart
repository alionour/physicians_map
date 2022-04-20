import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/globals.dart';
import 'package:physicians_map/src/routing/routing.dart';
import 'package:physicians_map/src/services/bloc_observer.dart';
import 'package:physicians_map/src/services/services_initialization.dart';
import 'package:physicians_map/src/themes/dark_theme.dart';
import 'package:physicians_map/src/themes/light_theme.dart';

import 'src/landing/landing_view.dart';

void main() async {
  await initializeGetStorage();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      theme: LightTheme.instance.lightTheme(),
      darkTheme: DarkTheme.instance.darkTheme(),
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      initialRoute: LandingView.routerName,
      onGenerateRoute: AppRouter.onRouteGeneration,
      // home: const LandingView(),
      builder: (context, child) {
        return Scaffold(
          body: Stack(
            children: [
              child!,
              Positioned(
                bottom: 0,
                right: 0,
                child: IconButton(
                  onPressed: () => Get.back(),
                  color: Colors.deepPurple,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
