import 'dart:developer';

import 'package:flutter/material.dart';

class ScreenLoader<T> extends StatelessWidget {
  final String loadingText;

  const ScreenLoader({
    Key? key,
    required this.future,
    required this.builder,
    this.loadingText = 'Loading...',
  }) : super(key: key);

  final Future<T> future;
  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        bool ready = snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null;
        if (snapshot.hasError) {
          log('Error loading screen', error: snapshot.error);
        }
        return ready
            ? builder(context, snapshot.data!)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/cat.png'),
                    height: 250,
                    width: 250,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      loadingText,
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                  )
                ],
              );
      },
    );
  }
}
