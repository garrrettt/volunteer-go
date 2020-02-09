import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hack_beanpot/helpers/TextDrawer.dart';
import 'package:hack_beanpot/models/CircularRegion.dart';
import 'package:uuid/uuid.dart';

/// version 2 of MapArea uses Google Maps
class MapArea extends StatefulWidget {
  @override
  _MapAreaState createState() => _MapAreaState();
}

class _MapAreaState extends State<MapArea> {
  String _mapStyle;
  GoogleMapController mapController;
  CameraPosition _backBay =
      CameraPosition(target: LatLng(42.355785, -71.065093), zoom: 14.0);

  List<Marker> textMarkers = [];
  List<Circle> circles = [];

  // community names
  List<BitmapDescriptor> commNames = [];

  @override
  void initState() {
    super.initState();

    // Circles require a unique id for google maps to keep track of all their states
    Uuid uuid = Uuid();

    rootBundle.loadString('assets/styles/map_style.txt').then((string) {
      _mapStyle = string;
    });

    rootBundle.loadString('assets/data/regions.json').then((String str) {
      var opportunitiesJson = jsonDecode(str);

      for (var opportunity in opportunitiesJson) {
        CircularRegion region = CircularRegion.fromJson(opportunity);
        Circle gMapsCircle = Circle(
            center: LatLng(region.x, region.y),
            radius: 500.0,
            fillColor: region.getColor(),
            circleId: CircleId(uuid.v4()),
            strokeWidth: 1);
        this.circles.add(gMapsCircle);

        TextDrawer textDrawer = TextDrawer();
        textDrawer
            .createCustomMarkerBitmap(region.region)
            .then((BitmapDescriptor bitmap) {

          // reload map
          setState(() {
          // add a caption to the circular region
            this.textMarkers.add(
                  Marker(
                    markerId: MarkerId(uuid.v4()),
                    icon: bitmap,
                    position: LatLng(region.x, region.y),
                  ),
                );
          });
        });
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          mapController.setMapStyle(_mapStyle);
        },
        initialCameraPosition: _backBay,
        markers: Set<Marker>.of(textMarkers),
        circles: Set<Circle>.of(circles),
      ),
    );
  }
}
