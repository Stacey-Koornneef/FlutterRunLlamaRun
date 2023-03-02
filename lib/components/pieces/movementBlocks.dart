import 'package:flame/components.dart';
import 'package:flame/flame.dart';

/*
creates a basic movement block, which is adjusted in the buttons
 */
class MovementBlocks extends SpriteComponent{
  MovementBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('forwardBlock.png')),
    position: Vector2(50, 50),
    size: Vector2(66.55, 22.75),
    priority: 10,
  );

  //not sure why this is here, but a little worried to take it out at the moment
  @override
  String toString(){
    return "Debug";
  }
}