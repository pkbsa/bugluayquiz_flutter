import 'package:flutter/material.dart';
import 'package:bugluayquiz/dependencies.dart';
import 'package:bugluayquiz/services.dart';
import 'package:bugluayquiz/theme.dart';
import 'package:bugluayquiz/views/intro_screen.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;
  final dependencies = await Dependencies.init;
  runApp(BugluayApp(dependencies: dependencies));
}

class BugluayApp extends StatelessWidget {
  final Dependencies dependencies;

  const BugluayApp({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return Services(
      dependencies: dependencies,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BuGluay',
        theme: theme,
        home: IntroScreen(),
      ),
    );
  }
}
