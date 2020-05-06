import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tictactoe/components/reusable_card.dart';
import 'package:tictactoe/screens/about_screen.dart';
import 'package:tictactoe/screens/player_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

var blueColor = Color(0xFF090e42);

class _MainScreenState extends State<MainScreen> {
  Future<bool> _backButtonAction() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  'No',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
              ),
              FlatButton(
                onPressed: () => exit(0),
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            ],
          ),
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _backButtonAction,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.greenAccent,
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
                    'Tic Tac Toe',
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
                      Navigator.pushNamed(context, PlayerScreen.id);
                    });
                  },
                  child: ReusableCard(
                    buttonText: 'Play Offline',
                    icon: Icons.play_arrow,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, PlayerScreen.id);
                    });
                  },
                  child: ReusableCard(
                    buttonText: 'Play Online',
                    icon: Icons.wifi,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, AboutScreen.id);
                    });
                  },
                  child: ReusableCard(
                    buttonText: 'About',
                    icon: Icons.book,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text('Do you want to exit an App'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: Text(
                              'No',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                          FlatButton(
                            onPressed: () => exit(0),
                            child: Text(
                              'Yes',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    );
                  },
                  child: ReusableCard(
                    buttonText: 'Exit',
                    icon: Icons.close,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
