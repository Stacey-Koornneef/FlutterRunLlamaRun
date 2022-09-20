import 'package:flame/components.dart';

//import 'package:flame/collisions.dart';
//import 'package:flame/components.dart';
import 'package:flame/flame.dart';



/*class Character extends PositionComponent {
  @override
  bool get debugMode => true;
}*/


class Character extends SpriteAnimationComponent {
  List<Sprite> runSprites = [
    Sprite(Flame.images.fromCache('llama_walk_back_1.png')),
    Sprite(Flame.images.fromCache('llama_walk_back_2.png')),
    Sprite(Flame.images.fromCache('llama_walk_back_3.png')),
    Sprite(Flame.images.fromCache('llama_walk_back_4.png')),
  ];

  SpriteAnimation? runAnimation;

  Character()
      : super(
    priority: 100,
    playing: true,
    scale: Vector2(1, 1),
    size: Vector2.all(25),
  ) {
    animation = SpriteAnimation.spriteList(runSprites, stepTime: 0.5);
    position = Vector2(175.0, 175.0);
    runAnimation = SpriteAnimation.spriteList(runSprites,
        stepTime: 0.5);
  }

  @override
  void update(double dt) {
    super.update(dt);
    animation!.update(dt);
  }
}