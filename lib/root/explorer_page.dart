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
      userData[0]['linki'],
      userData[0]['name'],
    ),
    Card(
      userData[1]['linki'],
      userData[1]['name'],
    ),
    Card(
      userData[2]['linki'],
      userData[2]['name'],
    ),
    Card(
      userData[3]['linki'],
      userData[3]['name'],
    ),
    Card(
      userData[4]['linki'],
      userData[4]['name'],
    ),
    Card(
      userData[5]['linki'],
      userData[5]['name'],
    ),
    Card(
      userData[6]['linki'],
      userData[6]['name'],
    ),
    Card(
      userData[7]['linki'],
      userData[7]['name'],
    ),
    Card(
      userData[8]['linki'],
      userData[8]['name'],
    ),
    Card(
      userData[9]['linki'],
      userData[9]['name'],
    ),
    Card(
      userData[10]['linki'],
      userData[10]['name'],
    ),
    Card(
      userData[11]['linki'],
      userData[11]['name'],
    ),
    Card(
      userData[12]['linki'],
      userData[12]['name'],
    ),
    Card(
      userData[13]['linki'],
      userData[13]['name'],
    ),
    Card(
      userData[14]['linki'],
      userData[14]['name'],
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
