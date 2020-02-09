import 'package:flutter/material.dart';
import 'package:hack_beanpot/screens/HomePage.dart';
import 'package:hack_beanpot/screens/MapPage.dart';

void main() => runApp(HackBeanpot());

/// the main class for this project
class HackBeanpot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beanteering',
      home: HomePage(),
    );
  }
}
