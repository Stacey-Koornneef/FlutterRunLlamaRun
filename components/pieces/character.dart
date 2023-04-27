import 'package:flame/components.dart';
import 'package:flame/flame.dart';

/*
creates the character image and gives it movement
 */
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
    priority: 4,
    playing: true,
    scale: Vector2(1, 1),
    size: Vector2.all(12.5),
  ) {
    animation = SpriteAnimation.spriteList(runSprites, stepTime: 0.5);
    position = Vector2(87.5, 87.5);
    runAnimation = SpriteAnimation.spriteList(runSprites,
        stepTime: 0.5);
  }

  //makes the llama animation update
  @override
  void update(double dt) {
    super.update(dt);
    animation!.update(dt);
  }
}