import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz,{super.key});


 final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Opacity(
          opacity: 1,
          child: Image.asset('assets/images/quiz-logo.png',
              height: 200, width: 200)),
      const SizedBox(height: 40),
      const Text(
        'Learn Flutter the fun way',
        style: TextStyle(color: Colors.white, fontSize: 27),
      ),
      const SizedBox(height: 40),
      OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz')),
    ]));
  }
}
