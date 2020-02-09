import 'package:flutter/material.dart';

/// represents different areas that can be captured by a particular team
class CircularRegion {
  String region;
  double x, y;

  /// 0 represents Yellow (Owl: FFDF57),
  /// 1 represents orange (Fox: FFB347),
  /// 2 represents blue (Otter: AEC6CF)
  int team;

  CircularRegion(this.region, this.x, this.y, this.team);

  factory CircularRegion.fromJson(Map<String, dynamic> json) {
    return CircularRegion(json["region"], json["x"], json["y"], json["team"]);
  }

  String getAnimal() {
    if (this.team == 0) return "Owl";
    if (this.team == 1) return "Fox";
    if (this.team == 2) return "Otter";
    else return null;
  }

  Color getColor() {
    if (this.team == 0) return Color(0xAAFFDF57);
    if (this.team == 1) return Color(0xAAFFB347);
    if (this.team == 2) return Color(0xAAAEC6CF);
    else return null;
  }
}