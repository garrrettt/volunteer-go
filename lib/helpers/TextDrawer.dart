import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hack_beanpot/models/CircularRegion.dart';
import 'package:uuid/uuid.dart';

/// assists with drawing text on Google Maps in the form that we can pass as an Icon
class TextDrawer {
  /// Google maps only lets you make markers on the map using Icons, so we'll sneak our text in
  /// by making it into a BitMap, which acts like an Icon.
  Future<BitmapDescriptor> createCustomMarkerBitmap(String text) async {
    PictureRecorder recorder = new PictureRecorder();
    Canvas c = new Canvas(recorder);

    TextSpan span = new TextSpan(
        style: new TextStyle(
          color: Colors.black,
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
        text: text);

    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(c, new Offset(20.0, 10.0));

    Picture p = recorder.endRecording();
    ByteData pngBytes =
        await (await p.toImage(tp.width.toInt() + 40, tp.height.toInt() + 20))
            .toByteData(format: ImageByteFormat.png);

    Uint8List data = Uint8List.view(pngBytes.buffer);

    return BitmapDescriptor.fromBytes(data);
  }

  /// Returns a list of Bitmaps converted from the given list of strings
  Future<List<BitmapDescriptor>> processList(List<String> strings) async {
    List<BitmapDescriptor> bitmapList = [];

    for (String str in strings) {
      bitmapList.add(await this.createCustomMarkerBitmap(str));
    }

    return Future.wait(
        strings.map((String str) => this.createCustomMarkerBitmap(str)));
  }

  /// returns a list of markers from a list of bitmaps, using the bitmaps as icons
  List<Marker> createTextMarkers(List<BitmapDescriptor> bitmaps, CircularRegion region) {
    Uuid uuid = new Uuid();

    return bitmaps.map((BitmapDescriptor bitmap) {
      return Marker(
        markerId: MarkerId(uuid.v4()),
        icon: bitmap,
        position: LatLng(region.x, region.y),
      );
    }).toList();
  }
}
