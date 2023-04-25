import 'package:flutter/material.dart';
import 'package:bugluayquiz/navigation.dart';
import 'package:bugluayquiz/services.dart';
import 'package:bugluayquiz/services/nickname_generator.dart';
import 'package:bugluayquiz/views/title_screen.dart';
import 'package:bugluayquiz/widgets/app_button.dart';
import 'package:bugluayquiz/widgets/app_input_field.dart';
import 'package:bugluayquiz/widgets/app_screen.dart';

class IntroScreen extends StatelessWidget {
  final _nicknameController =
      TextEditingController(text: NicknameGenerator.generate);

  IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScreen(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('assets/logo.png')),
          SizedBox(height: 16),
          Text(
            'Insert a Nickname',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 16),
          AppInputField(controller: _nicknameController),
          Row(
            children: [
              Expanded(
                child: AppButton(
                    label: 'Play',
                    onPressed: () async {
                      await Services.of(context)
                          .authService
                          .signIn(_nicknameController.text);
                      switchScreen(context, const TitleScreen());
                    },
                    backgroundColor: Color.fromRGBO(200, 101, 215, 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
