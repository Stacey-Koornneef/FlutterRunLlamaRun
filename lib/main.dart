import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'llama.dart';

void main() {
  final game = LlamaGame();
  runApp(GameWidget(game: game));
}