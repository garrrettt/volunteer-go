import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'package:hack_beanpot/models/VolunteerOpportunity.dart';
import 'package:url_launcher/url_launcher.dart';

class VolunteerPage extends StatefulWidget {
  @override
  _VolunteerPageState createState() => _VolunteerPageState();
}

List<VolunteerOpportunity> signedUpFor = [];

class _VolunteerPageState extends State<VolunteerPage> {
  List<VolunteerOpportunity> opportunities = [];
  bool loggingHours = false;

  Widget renderOpportunities() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (opportunities.length == 0)
          // needed to specify size of container so it wasn't infinite (which crashes flutter)
          return Container(width: 50, height: 50);
        else
          return VolunteerOpportunityCard(opportunities[index], true);
      },
      shrinkWrap: true,
    );
  }

  Widget renderLogHours() {
    return ListView(children: <Widget>[
      if (signedUpFor.length == 0)
        // needed to specify size of container so it wasn't infinite (which crashes flutter)
        Container(width: 50, height: 50)
      else
        for (VolunteerOpportunity opp in signedUpFor)
          VolunteerOpportunityCard(opp, false)
    ]);
  }

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/data/jobs.json').then((String str) {
      var opportunitiesJson = jsonDecode(str);

      for (var opportunity in opportunitiesJson) {
        this.opportunities.add(VolunteerOpportunity.fromJson(opportunity));
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 210, 110, 110),
        title: Text('VOLUNTEER'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Row(
              children: <Widget>[
                Text('Log', style: TextStyle(fontWeight: FontWeight.bold)),
                !loggingHours
                    ? IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: () {
                          setState(() {
                            loggingHours = true;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          setState(() {
                            loggingHours = false;
                          });
                        },
                      ),
              ],
            ),
          ),
        ],
      ),
      body: loggingHours ? renderLogHours() : renderOpportunities(),
    );
  }
}

class VolunteerOpportunityCard extends StatefulWidget {
  final VolunteerOpportunity opportunity;
  final bool signedUp;

  VolunteerOpportunityCard(this.opportunity, this.signedUp);

  @override
  _VolunteerOpportunityCardState createState() =>
      _VolunteerOpportunityCardState(opportunity, signedUp);
}

class _VolunteerOpportunityCardState extends State<VolunteerOpportunityCard> {
  VolunteerOpportunity opportunity;
  bool signedUp;

  _VolunteerOpportunityCardState(this.opportunity, this.signedUp);

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Text(
              this.opportunity.title,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(this.opportunity.host),
            Text('Description: ' + this.opportunity.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('More Info'),
                  onPressed: () {
                    _launchURL(this.opportunity.url);
                  },
                ),
                this.signedUp
                    ? IconButton(
                        icon: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            this.signedUp = false;
                            signedUpFor.add(this.opportunity);
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            this.signedUp = true;
                            signedUpFor.remove(this.opportunity);
                          });
                        },
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
