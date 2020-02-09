import 'package:flutter/material.dart';
import 'package:hack_beanpot/screens/partials/MapAreaV2.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

String description =
    "Volunteer Go is a smartphone app that combines gaming with real world volunteer work. You are randomly assigned a team from three choices: Owls (yellow), Foxes (orange), or Otters (blue). You can then access lists of volunteer opportunities that are detected to be near you and add them to your log. Then, the app uses location tracking to tell if you have arrived at and completed the volunteer work, and if so the event gets checked off in your log. For each event you get verified for attending, the team you are a part of gets a point added to their total score. \n\nNext, the app uses mapping technology to divy Boston into sections based on neighborhood. The mapping technology figures out which team has the most points in each region, and colors that region the team color. So, get excited to volunteer more, help out your community, and assist your team in taking over the Boston map!";

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAP'),
        backgroundColor: Color.fromARGB(255, 210, 110, 110),
      ),
      body: SlidingUpPanel(
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_drop_up),
              ),
              Text(description),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            MapArea(),
          ],
        ),
      ),
    );
  }
}
