import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:bugluayquiz/models/game_status.dart';
import 'package:bugluayquiz/models/multiplayer_game.dart';
import 'package:bugluayquiz/navigation.dart';
import 'package:bugluayquiz/services/game_service.dart';
import 'package:bugluayquiz/views/multiplayer_game/game_manager_page.dart';
import 'package:bugluayquiz/widgets/players_in_game.dart';

class LobbyPagePlayer extends StatefulWidget {
  final MultiplayerGame game;
  final GameService gameService;

  const LobbyPagePlayer({
    Key? key,
    required this.game,
    required this.gameService,
  }) : super(key: key);

  @override
  State<LobbyPagePlayer> createState() => _MultiplayerGamePlayerIntroState();
}

class _MultiplayerGamePlayerIntroState extends State<LobbyPagePlayer> {
  late StreamSubscription _statusSubscription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Waiting for host to start the game...',
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: LinearProgressIndicator(),
        ),
        PlayersInGame(gameId: widget.game.id),
      ],
    );
  }

  @override
  void initState() {
    _statusSubscription =
        widget.gameService.getGameStatus(widget.game.id).listen((status) async {
      log('Received game status update: $status');
      if (status == GameStatus.started) {
        final questions = await widget.gameService.getQuestions(widget.game.id);
        switchScreen(context,
            MultiplayerGameView(game: widget.game, questions: questions));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _statusSubscription.cancel();
    super.dispose();
  }
}
