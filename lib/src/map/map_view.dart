import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physicians_map/src/map/map_small_screens.dart';

class MapView extends GetResponsiveView {
  MapView({Key? key}) : super(key: key);

  @override
  Widget phone() => const MapSmallScreens();
}
