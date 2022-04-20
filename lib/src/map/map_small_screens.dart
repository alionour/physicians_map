import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:physicians_map/src/app_bar/app_bar.dart';
import 'package:physicians_map/src/map/current_location.dart';

class MapSmallScreens extends StatefulWidget {
  const MapSmallScreens({Key? key}) : super(key: key);

  @override
  _MapSmallScreensState createState() => _MapSmallScreensState();
}

class _MapSmallScreensState extends State<MapSmallScreens>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // determinePosition();
    return Scaffold(
        appBar: CustomAppBar(
          titleText: 'Map',
        ),
        body: Center(
          child: FutureBuilder<Position>(
              future: determinePosition(),
              builder:
                  (BuildContext context, AsyncSnapshot<Position> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.done:
                    if (snapshot.data != null) {
                      return GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(snapshot.data!.latitude,
                                snapshot.data!.longitude)),
                      );
                    }
                    return const GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(26.3372836509, 31.7369287189)),
                    );

                  default:
                    return const GoogleMap(
                      initialCameraPosition: CameraPosition(
                          target: LatLng(26.3372836509, 31.7369287189)),
                    );
                }
              }),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
