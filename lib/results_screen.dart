import 'package:flutter/material.dart';
import 'package:flutter_quiz/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.selectedAnswerList,
      required this.onRestartQuiz});
  final questionList = questions;
  final List<String> selectedAnswerList;
  final VoidCallback onRestartQuiz; // Callback function to restart the quiz
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < questions.length; i++) {
      summary.add({
        'questionIndex': i + 1, // Human-readable index (1-based)
        'questionText': questions[i].text, // The text of the question
        'correctAnswer': questions[i].answers[0], // Correct answer
        'selectedAnswer': i < selectedAnswerList.length
            ? selectedAnswerList[i]
            : 'No answer selected', // Selected answer or default message
        'isCorrect': i < selectedAnswerList.length &&
            questions[i].answers[0] ==
                selectedAnswerList[i], // Whether the answer is correct
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    int correctCount = 0;
    for (int i = 0; i < questionList.length; i++) {
      if (i < selectedAnswerList.length &&
          questionList[i].answers[0] == selectedAnswerList[i]) {
        correctCount++;
      }
    }

    //final summaryData=getSummaryData();
    // final noOfCorrectAnswer= summaryData.where((data){
    //   return (data['correctAnswer']==data['selectedAnswer']);
    // }).length;

    return SizedBox(
        width: double.infinity,
        
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Question: ${questions.length} Correct Answer: $correctCount',
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];
                      final correctAnswer = question.answers[0];
                      final selectedAnswer = index < selectedAnswerList.length
                          ? selectedAnswerList[index]
                          : 'No answer selected';

                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Q${index + 1}: ${question.text}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Your Answer: $selectedAnswer',
                              style: TextStyle(
                                color: selectedAnswer == correctAnswer
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Correct Answer: $correctAnswer',
                              style: const TextStyle(
                                  color: Colors.green, fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: onRestartQuiz,

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 15),
                    backgroundColor: Colors.deepPurple, // Background color
                    foregroundColor: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(25), // Rounded corners
                    ),
                    elevation: 5,
                  ), // Shadow elevation

                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
