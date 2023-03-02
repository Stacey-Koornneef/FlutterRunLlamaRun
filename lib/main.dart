import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'llama.dart';


//Main function, only calls the game and runs the app.  All game functionality in llama.dart
void main() {
  final game = LlamaGame();
  runApp(GameWidget(game: game));
}