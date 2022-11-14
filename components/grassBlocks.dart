import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/flame.dart';


/*class Blocks extends PositionComponent {
  @override
  bool get debugMode => true;
}*/

class GrassBlocks extends SpriteComponent{
  GrassBlocks() : super(
    sprite: Sprite(Flame.images.fromCache('mygrasslarge.jpg')),
    position: Vector2(50, 50),
    size: Vector2(50, 50),
    priority: 2,
  );
}