import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;

  void changeQuestion() {
    setState(() {
      if (questions.length - 1 > currentQuestionIndex) {
        currentQuestionIndex++;
      } else {
        // Sorular bittiğinde ResultScreen'i göster
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              onRestartQuiz: resetQuiz,
            ),
          ),
        );
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(currentQuestion.question),
                  ...currentQuestion.answers.map((answer) {
                    return ElevatedButton(
                      child: Text(answer),
                      onPressed: changeQuestion,
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

