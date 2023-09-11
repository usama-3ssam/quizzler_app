import 'package:flutter/material.dart';
import 'quiz_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBank quizBank = QuizBank();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text(
            'Ekhtibar',
          ),
          centerTitle: true,
        ),
        body: const SafeArea(
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
  const QuizPage({Key? key}) : super(key: key);

  @override
  QuizPageState createState() => QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  int rightAnswers = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBank.getCorrectAnswer();
    setState(
      () {
        if (userPickedAnswer == correctAnswer) {
          rightAnswers++;
          scoreKeeper.add(
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.thumb_up,
                color: Colors.green,
              ),
            ),
          );
        } else {
          scoreKeeper.add(
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Icon(
                Icons.thumb_down,
                color: Colors.red,
              ),
            ),
          );
        }
        if (quizBank.isFinished() == true) {
          Alert(
            context: context,
            title: "Exam ends",
            desc: "You answered $rightAnswers out of 7 questions.",
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                width: 120,
                child: const Text(
                  "start again",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ).show();
          quizBank.resat();
          scoreKeeper = [];
          rightAnswers = 0;
        } else {
          quizBank.nextQuestion();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: scoreKeeper,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Image.asset(
                      quizBank.getImage(),
                    ),
                    Text(
                      '(Q) ${quizBank.getQuestionText()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
                child: MaterialButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  child: const Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
                child: MaterialButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  child: const Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }
  }
}
