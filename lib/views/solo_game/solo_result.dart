import 'package:flutter/material.dart';
import 'package:bugluayquiz/widgets/app_button.dart';

class SoloResult extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const SoloResult({
    Key? key,
    required this.correctAnswers,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(correctAnswers);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'QUIZ',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        Text(
          'COMPLETED!',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        Image(
          image: AssetImage('assets/check.png'),
          height: 180,
          width: 180,
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$correctAnswers',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1?.copyWith(
                    color: Color.fromRGBO(244, 246, 106, 1), fontSize: 34),
              ),
              Text('/$totalQuestions',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: Color.fromRGBO(244, 246, 106, 1), fontSize: 34)),
            ],
          ),
        ),
        const SizedBox(height: 24.0),
        AppButton(
          label: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Color.fromRGBO(200, 101, 215, 1),
        ),
      ],
    );
  }
}
