import 'package:flutter/material.dart';
import 'package:tictactoe/utlis/constant.dart';
import 'package:tictactoe/utlis/custom_dialouge.dart';
import 'package:tictactoe/utlis/game_button.dart';

class MultiPlayerScreen extends StatefulWidget {
  static const String id = 'multiplayer_screen';
  @override
  _MultiPlayerScreenState createState() => _MultiPlayerScreenState();
}

var blueColor = Color(0xFF090e42);

class _MultiPlayerScreenState extends State<MultiPlayerScreen> {
  List<GameButton> buttonsList;

  int player1Score = 0;
  int player2Score = 0;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButton> doInit() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;

    var gameButtons = <GameButton>[
      new GameButton(id: 1),
      new GameButton(id: 2),
      new GameButton(id: 3),
      new GameButton(id: 4),
      new GameButton(id: 5),
      new GameButton(id: 6),
      new GameButton(id: 7),
      new GameButton(id: 8),
      new GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = 'X';
        gb.bg = Colors.redAccent;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = 'O';
        gb.bg = Colors.blueAccent;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
              context: context,
              builder: (_) => CustomDialouge('Game Tied',
                  'Press the reset button to start game', resetGame));
        }
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }

    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }

    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }

    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }

    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => CustomDialouge('Player 1 Won',
              'Press the reset button to start again', resetGame),
        );
        player1Score++;
      } else {
        showDialog(
          context: context,
          builder: (_) => CustomDialouge('Player 2 Won',
              'Press the reset button to start again', resetGame),
        );
        player2Score++;
      }
    }
    return winner;
  }

  void resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList = doInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                padding: EdgeInsets.all(10.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, i) => new SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: new RaisedButton(
                    padding: EdgeInsets.all(10.0),
                    onPressed: buttonsList[i].enabled
                        ? () => playGame(buttonsList[i])
                        : null,
                    child: new Text(
                      buttonsList[i].text,
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    color: buttonsList[i].bg,
                    disabledColor: buttonsList[i].bg,
                  ),
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Move of : Player $activePlayer',
                      style: kMutliPlayerHeader,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            ' Player 1 \nScore = $player1Score',
                            style: kMutliPlayerHeader,
                          ),
                          SizedBox(
                            width: 120.0,
                          ),
                          Text(
                            ' Player 2 \nScore = $player2Score',
                            style: kMutliPlayerHeader,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // RaisedButton(
            //   onPressed: () {
            //     setState(() {
            //       buttonsList = doInit();
            //     });
            //   },
            //   child: Text(
            //     'Reset',
            //     style: TextStyle(color: Colors.white, fontSize: 20.0),
            //   ),
            //   color: blueColor,
            //   padding: const EdgeInsets.all(20.0),
            // ),
            GestureDetector(
              onTap: () {
                setState(() {
                  buttonsList = doInit();
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Reset',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                color: blueColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 70.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
