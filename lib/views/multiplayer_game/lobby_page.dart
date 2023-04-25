import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bugluayquiz/models/game_status.dart';
import 'package:bugluayquiz/models/multiplayer_game.dart';
import 'package:bugluayquiz/navigation.dart';
import 'package:bugluayquiz/services.dart';
import 'package:bugluayquiz/views/multiplayer_game/game_manager_page.dart';
import 'package:bugluayquiz/widgets/app_button.dart';
import 'package:bugluayquiz/widgets/players_in_game.dart';

class LobbyPage extends StatelessWidget {
  final MultiplayerGame game;

  const LobbyPage({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('GAME CODE',
              style: TextStyle(color: Colors.white, fontSize: 32)),
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            game.code,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: Colors.white),
          ),
        ),
        PlayersInGame(gameId: game.id),
        const SizedBox(height: 20.0),
        AppButton.expanded(
            label: 'Start game',
            onPressed: () async {
              final gameService = Services.of(context).gameService;
              await gameService.updateGameStatus(game.id, GameStatus.started);
              log('Game ${game.id} started');
              final questions = await gameService.getQuestions(game.id);
              switchScreen(context,
                  MultiplayerGameView(game: game, questions: questions));
            },
            backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
      ],
    );
  }
}
