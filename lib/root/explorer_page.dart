import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import '../constants.dart';

// Link to DB
final List data = [
  {
    'color': Colors.red,
    'linki': 'images/dog1.jpg',
  },
  {
    'color': Colors.green,
    'linki': 'images/dog3.jpg',
  },
  {
    'color': Colors.blue,
    'linki': 'images/dog2.jpg',
  }
];

class Tinder extends StatefulWidget {
  @override
  _TinderState createState() => _TinderState();
}

class _TinderState extends State<Tinder> {
  // Dynamically load cards from database
  List<Card> cards = [
    Card(
      data[0]['color'],
    ),
    Card(
      data[1]['color'],
    ),
    Card(
      data[2]['color'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Stack of cards that can be swiped. Set width, height, etc here.
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // Important to keep as a stack to have overlay of cards.
      child: Stack(
        children: cards,
      ),
    );
  }
}

class Card extends StatelessWidget {
  // Made to distinguish cards
  // Add your own applicable data here
  final Color color;
  Card(this.color);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      // Set the swipable widget
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Image.asset('images/dog1.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
        ),
      ),
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
