import 'package:flutter/material.dart';
import 'package:bugluayquiz/models/game_question.dart';
import 'package:bugluayquiz/widgets/app_button.dart';

class AnswerPage extends StatelessWidget {
  static const red = Color(0xFFCE5152);

  final GameQuestion question;
  final Duration timeLimit;
  final Function(String) onAnswerSelected;
  final String? selected;

  const AnswerPage({
    Key? key,
    required this.question,
    required this.timeLimit,
    required this.onAnswerSelected,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24.0),
        children: <Widget>[
          TimeLimitIndicator(
            key: ValueKey(question.text),
            duration: timeLimit,
          ),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question.text,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 24.0, color: Colors.white),
            ),
          ),
          const SizedBox(height: 12.0),
          ListView(
            shrinkWrap: true,
            children: question.shuffledAnswers.map(
              (answer) {
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
              },
            ).toList(),
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

class TimeLimitIndicator extends StatelessWidget {
  final Duration duration;

  const TimeLimitIndicator({Key? key, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: IntTween(begin: 1, end: 100),
      duration: duration,
      builder: (context, value, _) {
        return LinearProgressIndicator(
          value: value / 100,
        );
      },
    );
  }
}
