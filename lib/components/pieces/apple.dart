import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class Apple extends SpriteComponent{
  Apple() : super(
    sprite: Sprite(Flame.images.fromCache('apple.png')),
    position: Vector2(50, 50),
    size: Vector2(50, 50),
    priority: 3,
  );
}