import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class PavementBlocks extends SpriteComponent{
  PavementBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('mypavementlarge.jpg')),
    position: Vector2(50, 50),
    size: Vector2(50, 50),
    priority: 1,
  );
}