import 'package:flutter/material.dart';
import 'package:tictactoe/utlis/constant.dart';

class AboutScreen extends StatefulWidget {
  static const String id = 'about_screen';
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

var blueColor = Color(0xFF090e42);

class _AboutScreenState extends State<AboutScreen> {
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
                  'About Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                'images/trans_white.png',
                height: MediaQuery.of(context).size.height - 500,
              ),
              Text(
                'Version : 1.0',
                style: kAboutTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Developed By : Amit Geed',
                style: kAboutTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Follow On Github : amitgeed',
                style: kAboutTextStyle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Connect Via Insagram : amit_geed_0808',
                style: kAboutTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
