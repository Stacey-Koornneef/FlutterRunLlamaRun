import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class Apple extends SpriteComponent{
  Apple() : super(
    sprite: Sprite(Flame.images.fromCache('apple.png')),
    position: Vector2(100, 100),
    size: Vector2(100, 100),
    priority: 3,
  );
}