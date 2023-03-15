import 'package:flutter/material.dart';
import 'dart:async';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int attempts = 0;
  bool oTurn = true;
  String resultDeclaration = '';
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBox = 0;
  bool winnerFound = false;
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  Timer? timer;
  List<int> matchedIndex = [];

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          StopTimer();
        }
      });
    });
  }

  void StopTimer() {
    resetTimer();
    timer?.cancel();
  }

  void resetTimer() {
    seconds = maxSeconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 89, 61),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Player O',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                      Text(oScore.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text('Player X',
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                      Text(xScore.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.white,
                                ),
                                color: matchedIndex.contains(index)
                                    ? Colors.blue
                                    : const Color.fromARGB(255, 213, 151, 19),
                              ),
                              child: Center(
                                child: Text(displayXO[index],
                                    style: const TextStyle(
                                      fontSize: 64,
                                      color: Color.fromARGB(255, 230, 89, 61),
                                    )),
                              ),
                            ),
                          ));
                    })),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      resultDeclaration,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    _buildTimer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    final isRunning = timer == null ? false : timer!.isActive;
    if (isRunning) {
      setState(() {
        if (oTurn && displayXO[index] == '') {
          displayXO[index] = 'O';
          filledBox++;
        } else if (!oTurn && displayXO[index] == '') {
          displayXO[index] = 'X';
          filledBox++;
        }
        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
        matchedIndex.addAll([0, 1, 2]);
        StopTimer();
      });
    }

    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[3]} Wins!';
        _updateScore(displayXO[3]);
        matchedIndex.addAll([4, 3, 5]);
        StopTimer();
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
        matchedIndex.addAll([6, 7, 8]);
        StopTimer();
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
        matchedIndex.addAll([0, 3, 6]);
        StopTimer();
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
        matchedIndex.addAll([2, 5, 8]);
        StopTimer();
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[1]} Wins!';
        _updateScore(displayXO[1]);
        matchedIndex.addAll([1, 4, 7]);
        StopTimer();
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
        matchedIndex.addAll([0, 4, 8]);
        StopTimer();
      });
    }
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
        matchedIndex.addAll([2, 4, 6]);
        StopTimer();
      });
    } else if (!winnerFound && filledBox == 9) {
      setState(() {
        resultDeclaration = 'Its a Draw';
        StopTimer();
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      filledBox = 0;
      matchedIndex = [];
    });
  }

  Widget _buildTimer() {
    final isRunning = timer == null ? false : timer!.isActive;
    return isRunning
        ? SizedBox(
            width: 100,
            height: 100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CircularProgressIndicator(
                  value: 1 - seconds / maxSeconds,
                  valueColor: const AlwaysStoppedAnimation(Colors.white),
                  strokeWidth: 8,
                  backgroundColor: const Color.fromARGB(255, 24, 197, 21),
                ),
                Center(
                  child: Text(
                    seconds.toString(),
                    style: const TextStyle(fontSize: 50, color: Colors.white),
                  ),
                )
              ],
            ),
          )
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
            onPressed: () {
              startTimer();
              _clearBoard();
              attempts++;
            },
            child: Text(
              attempts == 0 ? 'Start' : 'Play Again!',
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ));
  }
}
