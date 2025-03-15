import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.answerSelect});

  final String answerText;
  final void Function() answerSelect;
  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: answerSelect,
      //style: ElevatedButton.styleFrom(
      // backgroundColor: const Color.fromARGB(255, 243, 241, 235)),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(),
      ),
    );
  }
}
