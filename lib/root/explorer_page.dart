import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import '../constants.dart';

// Link to DB
final List data = [
  {
    'name': 'Shawn',
    'linki': 'images/dog1.jpg',
  },
  {
    'name': 'Kevin',
    'linki': 'images/dog2.jpg',
  },
  {
    'name': 'Tron',
    'linki': 'images/dog3.jpg',
  },
  {
    'name': 'Candy',
    'linki': 'images/dog4.jpg',
  },
  {
    'name': 'Cindy',
    'linki': 'images/dog5.jpg',
  },
  {
    'name': 'Dough',
    'linki': 'images/dog6.jpg',
  },
  {
    'name': 'Bon',
    'linki': 'images/dog7.jpg',
  },
  {
    'name': 'Den',
    'linki': 'images/dog8.jpg',
  },
  {
    'name': 'Sam',
    'linki': 'images/dog9.jpg',
  },
  {
    'name': 'Danny',
    'linki': 'images/dog10.jpg',
  },
  {
    'name': 'Ben',
    'linki': 'images/dog11.jpg',
  },
  {
    'name': 'Sans',
    'linki': 'images/dog12.jpg',
  },
  {
    'name': 'Sam',
    'linki': 'images/dog13.jpg',
  },
  {
    'name': 'Lis',
    'linki': 'images/dog14.jpg',
  },
  {
    'name': 'Jenny',
    'linki': 'images/dog15.jpg',
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
      data[0]['linki'],
    ),
    Card(
      data[1]['linki'],
    ),
    Card(
      data[2]['linki'],
    ),
    Card(
      data[3]['linki'],
    ),
    Card(
      data[4]['linki'],
    ),
    Card(
      data[5]['linki'],
    ),
    Card(
      data[6]['linki'],
    ),
    Card(
      data[7]['linki'],
    ),
    Card(
      data[8]['linki'],
    ),
    Card(
      data[9]['linki'],
    ),
    Card(
      data[10]['linki'],
    ),
    Card(
      data[11]['linki'],
    ),
    Card(
      data[12]['linki'],
    ),
    Card(
      data[13]['linki'],
    ),
    Card(
      data[14]['linki'],
    )
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
  String linki = '';
  Card(this.linki);

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
          child: Image.asset(linki,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
        ),
      ),
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
