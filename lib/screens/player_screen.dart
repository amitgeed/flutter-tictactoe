import 'package:flutter/material.dart';
import 'package:tictactoe/components/reusable_card.dart';
import 'package:tictactoe/screens/multiplayer_screen.dart';
import 'package:tictactoe/screens/single_player_screen.dart';

class PlayerScreen extends StatefulWidget {
  static const String id = 'player_screen';
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

var blueColor = Color(0xFF090e42);

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [blueColor.withOpacity(0.4), blueColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'Select Player Mode',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, SinglePlayerScreen.id);
                  });
                },
                child: ReusableCard(
                  buttonText: 'Single Player',
                  icon: Icons.person,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(context, MultiPlayerScreen.id);
                  });
                },
                child: ReusableCard(
                  buttonText: 'MultiPlayer',
                  icon: Icons.people,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
