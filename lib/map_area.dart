import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:next2you/profile_drawer.dart';

class MappingArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MappingArea();
  }
}

class _MappingArea extends State<MappingArea> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      drawer: ProfileDrawer(),
      body: MapSample(scaffoldKey),
    );
  }
}

class MapSample extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  MapSample(this.scaffoldKey);
  @override
  State<MapSample> createState() => _MapSample();
}

class _MapSample extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(39.999158, -83.014830),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        GestureDetector(
          onTap: () {
            widget.scaffoldKey.currentState.openDrawer();
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 40,
              left: 10,
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/avatar.jpg",
                fit: BoxFit.cover,
                width: 50.0,
                height: 50.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
