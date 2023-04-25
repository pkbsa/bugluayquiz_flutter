import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bugluayquiz/repositories/trivia_repository.dart';
import 'package:bugluayquiz/services/auth_service.dart';
import 'package:bugluayquiz/services/game_service.dart';

class Dependencies {
  final AuthService authService;
  final GameService gameService;

  Dependencies._(this.authService, this.gameService);

  static Future<Dependencies> get init async {
    final supabase = await Supabase.initialize(
      url: 'https://cgojktnqmyultwxanpbx.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNnb2prdG5xbXl1bHR3eGFucGJ4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzkyMTA0MjIsImV4cCI6MTk5NDc4NjQyMn0.kEZvxMSH5Y4W4k6WY6JcvAYEy9LHlU6jwGMfk8x6Xx8',
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    final authService = AuthService(supabase.client.auth, sharedPreferences);
    final gameService =
        GameService(authService, TriviaRepository(), Supabase.instance.client);
    return Dependencies._(authService, gameService);
  }
}
