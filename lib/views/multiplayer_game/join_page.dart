import 'package:flutter/material.dart';
import 'package:bugluayquiz/navigation.dart';
import 'package:bugluayquiz/services.dart';
import 'package:bugluayquiz/services/game_service.dart';
import 'package:bugluayquiz/views/multiplayer_game/lobby_page_player.dart';
import 'package:bugluayquiz/widgets/app_button.dart';
import 'package:bugluayquiz/widgets/app_input_field.dart';
import 'package:bugluayquiz/widgets/app_screen.dart';

class JoinPage extends StatelessWidget {
  final _gameCodeController = TextEditingController();

  JoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Join a game',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
          SizedBox(height: 26),
          Image(
            image: AssetImage('assets/cat.png'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 15),
          AppInputField(
              controller: _gameCodeController, hintText: 'Enter game code'),
          const SizedBox(height: 8.0),
          AppButton.expanded(
              label: 'Join game',
              onPressed: () async {
                try {
                  final gameService = Services.of(context).gameService;
                  final game = await gameService
                      .joinMultiplayerGame(_gameCodeController.text);
                  switchScreen(
                      context,
                      LobbyPagePlayer(
                        game: game,
                        gameService: gameService,
                      ));
                } on InvalidGameCodeException catch (ex) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        ex.message.toUpperCase() + '.',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
        ],
      ),
    );
  }
}
