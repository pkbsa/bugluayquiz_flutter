import 'package:flutter/material.dart';
import 'package:bugluayquiz/models/player_score.dart';

class ResultPage extends StatelessWidget {
  final List<PlayerScore> scores;
  final String userId;

  const ResultPage({
    Key? key,
    required this.scores,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentScore = -1;
    int rank = 0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Results',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white)),
        ),
        Image(image: AssetImage('assets/medal.png'), height: 220, width: 220),
        ...scores.map(
          (score) {
            final lineStyle = TextStyle(
                color: score.userId == userId
                    ? Color.fromARGB(255, 255, 255, 255)
                    : Colors.black);
            if (score.score != currentScore) {
              currentScore = score.score;
              rank++;
            }
            return ListTile(
              title: Text(
                '$rank. ${score.nickname}',
                style: lineStyle,
              ),
              trailing: Text(score.score.toString(), style: lineStyle),
            );
          },
        ),
      ],
    );
  }
}
