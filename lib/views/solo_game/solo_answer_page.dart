import 'package:flutter/material.dart';
import 'package:bugluayquiz/models/trivia_question.dart';
import 'package:bugluayquiz/widgets/app_button.dart';

class SoloAnswerPage extends StatelessWidget {
  static const red = Color(0xFFCE5152);

  final TriviaQuestion question;
  final Function(String) onAnswerSelected;
  final String? selected;

  const SoloAnswerPage({
    Key? key,
    required this.question,
    required this.onAnswerSelected,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 48.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 24.0, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: question.shuffledAnswers.map((answer) {
                return AppButton(
                  onPressed: selected == null
                      ? () {
                          onAnswerSelected(answer);
                        }
                      : null,
                  label: answer,
                  backgroundColor: getColor(answer),
                  textColor: Colors.black,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Color? getColor(String answer) {
    final List<Color> answerColors = [
      Color.fromRGBO(244, 246, 106, 1),
      Color.fromRGBO(106, 204, 246, 1),
      Color.fromRGBO(246, 131, 106, 1),
      Color.fromRGBO(243, 106, 246, 1),
    ];
    if (selected == null) {
      int answerIndex = question.shuffledAnswers.indexOf(answer);
      if (answerIndex >= 0 && answerIndex < answerColors.length) {
        return answerColors[answerIndex];
      }
    }
    if (answer == question.correctAnswer) {
      return Colors.green;
    }
    return red;
  }
}
