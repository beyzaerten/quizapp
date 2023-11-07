import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestartQuiz;

  ResultScreen({required this.onRestartQuiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Quiz Bitti",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: onRestartQuiz, // Yeniden başlatma işlevi
              child: Text("Yeniden Başla"),
            ),
          ],
        ),
      ),
    );
  }
}


