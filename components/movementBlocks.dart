import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class MovementBlocks extends SpriteComponent{
  MovementBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('forwardBlock.png')),
    position: Vector2(100, 100),
    size: Vector2(264.2, 91),
    priority: 10,
  );

  @override
  String toString(){
    return "Debug";
  }
}