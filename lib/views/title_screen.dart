import 'package:flutter/material.dart';
import 'package:bugluayquiz/views/multiplayer_game/join_page.dart';
import 'package:bugluayquiz/views/multiplayer_game/create_page.dart';
import 'package:bugluayquiz/views/solo_game/solo_create.dart';
import 'package:bugluayquiz/views/solo_game/creator_page.dart';
import 'package:bugluayquiz/widgets/app_button.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'BuGluay ',
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        ),
        Image(
          image: AssetImage('assets/person.png'),
          width: 200,
          height: 200,
        ),
        AppButton.expanded(
            label: 'Join game',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => JoinPage(),
                ),
              );
            },
            backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
        AppButton.expanded(
            label: 'Host game',
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreatePage(),
                ),
              );
            },
            backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
        AppButton.expanded(
            label: 'Practice',
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SoloCreate(),
                ),
              );
            },
            backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
        AppButton.expanded(
            label: 'Creator',
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreatorPage(),
                ),
              );
            },
            backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
      ],
    );
  }
}
