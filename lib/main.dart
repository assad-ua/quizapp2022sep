import 'package:flutter/material.dart';
import 'quizbrains.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


//object
QuizBrain quizBrain = QuizBrain();


void main() => runApp(quiz());

class quiz extends StatelessWidget {
  const quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black54,
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
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> ScoreKeeper = [];


  void answercheck(bool userpickedanswer) {
    bool checkans = quizBrain.getQuestionans();
    setState(() {
      if(quizBrain.isFinished() == true)
        {
          Alert(
            context: context,
            title: 'Finished',
            desc: 'You have finished the quiz',
          ).show();
          quizBrain.reset();
          ScoreKeeper = [];
        }
      else {
        if (checkans == true) {
          ScoreKeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          ScoreKeeper.add(Icon(Icons.close, color: Colors.red));
        }

        quizBrain.nextquestion();
      }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //textbox
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
            ),
          ),
        ),
        //true button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {
                  answercheck(true);
                },
                child: Text(
                  'True',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
        ),
        //false button
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  answercheck(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ),
        ),
        //Scorekeeping Row
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}

//Alert(context: context, title: "FINISHED", desc: "You have reached the end of the quiz").show();