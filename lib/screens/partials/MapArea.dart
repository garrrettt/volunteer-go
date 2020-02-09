// old version: this version uses a static image instead of an actual map

// import 'package:flutter/material.dart';
// import 'package:photo_view/photo_view.dart';

// class MapArea extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Expanded(
//         child: PhotoView.customChild(
//           child: MapWithDots(),
//           initialScale: PhotoViewComputedScale.covered,
//           minScale: PhotoViewComputedScale.covered,
//         ),
//       ),
//     );
//   }
// }

// class MapWithDots extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Image.asset('assets/img/boston.png'),

//         // draw all circles of the communities in Boston
//         Positioned(child: Circle(), left: 100.0),
//         Circle()
//       ],
//     );
//   }
// }

// class Circle extends StatelessWidget {
//   double size;
//   Color color;

//   Circle({this.size = 60, this.color = Colors.black});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: this.size,
//       height: this.size,
//       decoration:
//           BoxDecoration(shape: BoxShape.circle, color: this.color),
//     );
//   }
// }
