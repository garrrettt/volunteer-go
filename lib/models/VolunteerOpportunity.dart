import 'package:flutter/material.dart';

class VolunteerOpportunity {
  String address = "";
  String title = "";
  String description = "";
  String host = "";
  String url = "";

  VolunteerOpportunity(
      this.address, this.title, this.description, this.host, this.url);

  factory VolunteerOpportunity.fromJson(Map<String, dynamic> json) {
    return VolunteerOpportunity(
      json["address"],
      json["title"],
      json["host"], // note that host and description are purposefully switched because the data was entered incorrectly in the json/db
      json["description"],
      json["url"],
    );
  }
}
