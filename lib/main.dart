import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizapp/models/quiz_question.dart';
import 'package:quizapp/data/questions.dart';

void main() {
  runApp(MaterialApp(home: QuestionScreen()));
}

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  List<String> shuffledAnswers = [];
  Random random = Random();

  @override
  void initState() {
    super.initState();
    showQuestion(currentQuestionIndex);
  }

  void showQuestion(int questionIndex) {
    final QuizQuestion question = questions[questionIndex];
    shuffledAnswers = List.from(question.answers)..shuffle();
    setState(() {});
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      currentQuestionIndex++;
      showQuestion(currentQuestionIndex);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(questions[currentQuestionIndex].question),
            ...shuffledAnswers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  nextQuestion();
                },
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
