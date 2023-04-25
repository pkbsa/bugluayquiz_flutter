import 'package:flutter/material.dart';
import 'package:bugluayquiz/models/solo_game.dart';
import 'package:bugluayquiz/models/trivia_question.dart';
import 'package:bugluayquiz/navigation.dart';
import 'package:bugluayquiz/views/solo_game/solo_answer_page.dart';
import 'package:bugluayquiz/views/solo_game/solo_result.dart';

class SoloGameManager extends StatefulWidget {
  final SoloGame game;

  const SoloGameManager({Key? key, required this.game}) : super(key: key);

  @override
  State<SoloGameManager> createState() => _SoloGameViewState();
}

class _SoloGameViewState extends State<SoloGameManager> {
  TriviaQuestion? question;
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    question = question ?? widget.game.nextQuestion!;
    return SoloAnswerPage(
      question: question!,
      selected: selectedAnswer,
      onAnswerSelected: (answer) async {
        setState(() {
          selectedAnswer = answer;
        });
        await Future.delayed(Duration(seconds: 2));
        widget.game.validateAnswer(answer, question!);
        next();
      },
    );
  }

  void next() {
    setState(() {
      final nextQuestion = widget.game.nextQuestion;
      if (nextQuestion != null) {
        setState(() {
          question = nextQuestion;
          selectedAnswer = null;
        });
      } else {
        switchScreen(
          context,
          SoloResult(
            correctAnswers: widget.game.correctAnswers,
            totalQuestions: widget.game.totalQuestions,
          ),
        );
      }
    });
  }
}
