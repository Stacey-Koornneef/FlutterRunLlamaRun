import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class PavementBlocks extends SpriteComponent{
  PavementBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('mypavementlarge.jpg')),
    position: Vector2(100, 100),
    size: Vector2(100, 100),
    priority: 1,
  );
}