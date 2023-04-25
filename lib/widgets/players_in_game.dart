import 'package:flutter/material.dart';
import '../services.dart';

class PlayersInGame extends StatelessWidget {
  final int gameId;

  const PlayersInGame({Key? key, required this.gameId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final containerWidth = screenWidth * 0.7;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StreamBuilder<List<String>>(
        stream: Services.of(context).gameService.getCurrentPlayers(gameId),
        initialData: const [],
        builder: (context, snapshot) {
          final players = snapshot.data ?? [];
          return Column(
            children: [
              const SizedBox(height: 12.0),
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Players',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    ...players.map(
                      (nickname) => Text(
                        nickname,
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Text(
                      '...',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
                width: containerWidth,
              ),
            ],
          );
        },
      ),
    );
  }
}
