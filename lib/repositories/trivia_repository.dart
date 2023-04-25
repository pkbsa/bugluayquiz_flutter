import 'dart:convert';

import 'package:bugluayquiz/models/trivia_question.dart';
import 'package:http/http.dart' as http;

class TriviaRepository {
  static const _authority = 'the-trivia-api.com';

  // TODO Select categories and difficulty.
  Future<List<TriviaQuestion>> getQuestions(
      String category, String difficulty, int numOfQuestions) async {
    final url = Uri.https(
      _authority,
      'api/questions',
      {
        'limit': numOfQuestions.toString(),
        'categories': category.toString(),
        'difficulties': difficulty.toString()
      },
    );
    final response = await http.get(url);
    final questions = jsonDecode(utf8.decode(response.bodyBytes)) as List;
    return questions
        .map((q) => TriviaQuestion.fromJson(q as Map<String, dynamic>))
        .toList();
  }
}
