import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';
import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/start_screen.dart';
import 'package:flutter_quiz/results_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  Widget? activeScreen;
  List<String> selectedAnswer = [];
  //or
  var activeScreen1 = 'start-screen';
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    setState(() {
      if (selectedAnswer.length == questions.length) {
       activeScreen= ResultsScreen(selectedAnswerList: selectedAnswer, onRestartQuiz: restartQuiz,);
        selectedAnswer = [];
        activeScreen1 = 'start-screen';
        
      }
    });
  }

   void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onAnswerSelection: chooseAnswer);
      //or
      activeScreen1 = 'question-screen';
    });
  }

  @override
  Widget build(context) {
    //Widget screenWidget=StartScreen(switchScreen);

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168)
              ]),
            ),
            // child: activeScreen1 == 'start-screen'
            //     ? StartScreen(switchScreen)
            //     : QuestionsScreen(onAnswerSelection: chooseAnswer)),
            child: activeScreen,
        )
      ),
    );
  }
}
