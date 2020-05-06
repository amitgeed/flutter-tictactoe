import 'package:flutter/material.dart';

class PlayOnlineScreen extends StatefulWidget {
  static const String id = 'play_online_screen';
  @override
  _PlayOnlineScreenState createState() => _PlayOnlineScreenState();
}

var blueColor = Color(0xFF090e42);

class _PlayOnlineScreenState extends State<PlayOnlineScreen> {
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
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'This Application is Under Development it Will Be Updated Soon till now enjoy offline mode.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
