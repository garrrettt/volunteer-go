import 'package:flutter/material.dart';
import 'package:hack_beanpot/screens/MapPage.dart';
import 'package:hack_beanpot/screens/VolunteerPage.dart';

/// the starting screen for logged in users
class HomePage extends StatelessWidget {
  var buttonTextStyle = TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/img/logo.png'),
        ),
        title: Text('TEAM POINTS'),
        backgroundColor: Color.fromARGB(255, 210, 110, 110),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Expanded(
            child: Column(
              children: <Widget>[
                Text('TEAM POINTS',
                    style:
                        TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('350',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text('370',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text('385',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  child: Image.asset('assets/img/animals.png'),
                ),
                Text(
                  'YOU ARE TEAM: OWL',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            flex: 4,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Container(
                width: double.infinity,
                height: 20.0,
                color: Color.fromARGB(255, 250, 215, 130),
              ),
            ),
          ),
          Expanded(
            child: ImageButton(
              left: Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Image.asset('assets/img/volunteer_button.png'),
              ),
              right: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('VOLUNTEER', style: buttonTextStyle),
                        Icon(Icons.thumb_up),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
              nextPage: VolunteerPage(),
            ),
          ),
          Expanded(
            child: ImageButton(
              left: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/img/boston_small.png'),
              ),
              right: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'MAP',
                          style: buttonTextStyle,
                        ),
                        Icon(Icons.location_on),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
              nextPage: MapPage(),
            ),
          ),
          Container(height: 50.0),
        ],
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  final Widget left, right, nextPage;

  ImageButton({this.left, this.right, this.nextPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => nextPage));
      },
      child: Card(
        child: Row(
          children: <Widget>[
            Expanded(child: left),
            Expanded(child: right),
          ],
        ),
      ),
    );
  }
}
