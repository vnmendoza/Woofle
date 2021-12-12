import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:woofle/Components/likes_json.dart';
import '../constants.dart';
import '../Components/user_cards.dart';

// Link to DB

class Tinder extends StatefulWidget {
  @override
  _TinderState createState() => _TinderState();
}

class _TinderState extends State<Tinder> {
  // Dynamically load cards from database
  List<Card> cards = [
    Card(
      data[0]['linki'],
      data[0]['name'],
    ),
    Card(
      data[1]['linki'],
      data[1]['name'],
    ),
    Card(
      data[2]['linki'],
      data[2]['name'],
    ),
    Card(
      data[3]['linki'],
      data[3]['name'],
    ),
    Card(
      data[4]['linki'],
      data[4]['name'],
    ),
    Card(
      data[5]['linki'],
      data[5]['name'],
    ),
    Card(
      data[6]['linki'],
      data[6]['name'],
    ),
    Card(
      data[7]['linki'],
      data[7]['name'],
    ),
    Card(
      data[8]['linki'],
      data[8]['name'],
    ),
    Card(
      data[9]['linki'],
      data[9]['name'],
    ),
    Card(
      data[10]['linki'],
      data[10]['name'],
    ),
    Card(
      data[11]['linki'],
      data[11]['name'],
    ),
    Card(
      data[12]['linki'],
      data[12]['name'],
    ),
    Card(
      data[13]['linki'],
      data[13]['name'],
    ),
    Card(
      data[14]['linki'],
      data[14]['name'],
    )
  ];

  @override
  Widget build(BuildContext context) {
    // Stack of cards that can be swiped. Set width, height, etc here.
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
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
  var name;

  Card(this.linki, this.name);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      // Set the swipable widget
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Stack(
            children: [
              Image.asset(linki,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  fit: BoxFit.cover),
              Text('$name',
                  style: TextStyle(color: Colors.white, fontSize: 60)),
            ],
          ),
        ),
      ),
      onSwipeRight: (finalPosition) {
        likesJson.add({'name': name, 'liki': linki});
      }, // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
