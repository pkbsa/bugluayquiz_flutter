import 'package:flutter/material.dart';
import 'package:bugluayquiz/navigation.dart';
import 'package:bugluayquiz/services.dart';
import 'package:bugluayquiz/views/multiplayer_game/lobby_page.dart';
import 'package:bugluayquiz/widgets/app_button.dart';
import 'package:bugluayquiz/widgets/app_input_field.dart';
import 'package:bugluayquiz/widgets/app_screen.dart';
import 'package:bugluayquiz/widgets/screen_loader.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _MultiplayerGameSettingsState createState() =>
      _MultiplayerGameSettingsState();
}

class _MultiplayerGameSettingsState extends State<CreatePage> {
  final numOfQuestionsController = TextEditingController(text: '5');
  final secondsPerQuestionController = TextEditingController(text: '5');
  String selectedDifficulty = 'Easy';
  String selectedCategory = 'All';
  List<String> difficultyLevels = ['Easy', 'Medium', 'Hard'];
  List<String> category = [
    'All',
    'General Knowledge',
    'Geography',
    'Science',
    'Sport',
    'Music'
  ];

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Host a game',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          SizedBox(height: 40),
          Text(
            'Categories',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: DropdownButtonFormField<String>(
                isExpanded: true,
                value: selectedCategory,
                onChanged: (newValue) {
                  setState(() {
                    selectedCategory = newValue!;
                  });
                },
                items: category.map((level) {
                  return DropdownMenuItem<String>(
                    value: level,
                    child: Text(level),
                    alignment: Alignment.center,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Difficulty level',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 8.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              value: selectedDifficulty,
              onChanged: (newValue) {
                setState(() {
                  selectedDifficulty = newValue!;
                });
              },
              items: difficultyLevels.map((level) {
                return DropdownMenuItem<String>(
                  value: level,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(level),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Number of questions',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          AppInputField.number(
            controller: numOfQuestionsController,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Seconds to answer',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          AppInputField.number(
            controller: secondsPerQuestionController,
          ),
          const SizedBox(height: 24.0),
          AppButton.expanded(
              label: 'Create game',
              onPressed: () async {
                final numOfQuestions =
                    int.tryParse(numOfQuestionsController.text) ?? 5;
                final secondsToAnswer =
                    int.tryParse(secondsPerQuestionController.text) ?? 5;
                switchScreen(
                  context,
                  ScreenLoader(
                    future: Services.of(context).gameService.newMultiplayerGame(
                        selectedCategory,
                        selectedDifficulty,
                        numOfQuestions,
                        secondsToAnswer),
                    builder: (context, game) => LobbyPage(game: game),
                  ),
                );
              },
              backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
        ],
      ),
    );
  }
}
