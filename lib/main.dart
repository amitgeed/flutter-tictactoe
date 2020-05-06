import 'package:flutter/material.dart';
import 'package:tictactoe/screens/about_screen.dart';
import 'package:tictactoe/screens/main_screen.dart';
import 'package:tictactoe/screens/multiplayer_screen.dart';
import 'package:tictactoe/screens/player_screen.dart';
import 'package:tictactoe/screens/play_online_screen.dart';
import 'package:tictactoe/screens/single_player_screen.dart';
import 'package:tictactoe/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        MainScreen.id: (context) => MainScreen(),
        PlayerScreen.id: (context) => PlayerScreen(),
        MultiPlayerScreen.id: (context) => MultiPlayerScreen(),
        SinglePlayerScreen.id: (context) => SinglePlayerScreen(),
        PlayOnlineScreen.id: (context) => PlayOnlineScreen(),
        AboutScreen.id: (context) => AboutScreen(),
      },
    );
  }
}
