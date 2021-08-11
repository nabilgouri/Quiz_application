import 'package:flutter/material.dart';
import 'package:quizzler/quizBank.dart';
import 'question.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  List<Widget> list_score = [];
  void checkQuest(bool picked_answer) {
    if (quizbank.isFinished() == true) {
      Alert(
        context: context,
        title: 'Finished!',
        desc: 'You\'ve reached the end of the quiz.',
        buttons: [
          DialogButton(
            child: Text(
              "Play again",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              setState(() {
                list_score.clear();
                quizbank.reset();
                Navigator.pop(context);
              });
            },
            width: 120,
          )
        ],
      ).show();
      list_score.clear();
      quizbank.reset();
    } else {
      if (quizbank.get_answer() == picked_answer) {
        list_score.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else if (quizbank.get_answer() != picked_answer) {
        list_score.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      setState(() {
        quizbank.nextQuest();
      });
    }
  }

  QuizBank quizbank = new QuizBank();
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbank.get_quest(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkQuest(true);
              },

              //The user picked true.
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                primary: Colors.blue,
                backgroundColor: Colors.red,
              ),
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkQuest(false);
              },
            ),
          ),
        ),
        Row(
          children: list_score,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
