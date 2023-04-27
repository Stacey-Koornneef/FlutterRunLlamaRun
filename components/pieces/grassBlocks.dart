import 'package:flame/components.dart';
import 'package:flame/flame.dart';

/*
creates the grass blocks for levels
 */
class GrassBlocks extends SpriteComponent{
  GrassBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('mygrasslarge.jpg')),
    position: Vector2(50, 50),
    size: Vector2(50, 50),
    priority: 2,
  );
}