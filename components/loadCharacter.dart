import 'package:flame/components.dart';

//import 'package:flame/collisions.dart';
//import 'package:flame/components.dart';
import 'package:flame/flame.dart';



/*class Character extends PositionComponent {
  @override
  bool get debugMode => true;
}*/


class LoadCharacter extends SpriteAnimationComponent {
  List<Sprite> runSprites = [
    Sprite(Flame.images.fromCache('llama_eat_1.png')),
    Sprite(Flame.images.fromCache('llama_eat_2.png')),
    Sprite(Flame.images.fromCache('llama_eat_3.png')),
    Sprite(Flame.images.fromCache('llama_eat_4.png')),
    Sprite(Flame.images.fromCache('llama_eat_3.png')),
    Sprite(Flame.images.fromCache('llama_eat_2.png')),
  ];

  SpriteAnimation? runAnimation;

  LoadCharacter()
      : super(
    priority: 4,
    playing: true,
    scale: Vector2(1, 1),
    size: Vector2.all(12.5),
  ) {
    animation = SpriteAnimation.spriteList(runSprites, stepTime: 0.5);
    position = Vector2(20, 20);
    runAnimation = SpriteAnimation.spriteList(runSprites,
        stepTime: 0.7);
  }

  @override
  void update(double dt) {
    super.update(dt);
    animation!.update(dt);
  }
}