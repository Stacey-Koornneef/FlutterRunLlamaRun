import 'package:flame/components.dart';
import 'package:flame/flame.dart';


class MovementBlocks extends SpriteComponent{
  MovementBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('forwardBlock.png')),
    position: Vector2(50, 50),
    size: Vector2(66.55, 22.75),
    priority: 10,
  );

  @override
  String toString(){
    return "Debug";
  }
}