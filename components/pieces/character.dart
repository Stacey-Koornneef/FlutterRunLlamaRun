import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../buttons/checkSolution.dart';
import '../../llama.dart';

/*
creates the character image and gives it movement
 */

final effectQueue = [];
var moveLength = (squareSide + squareGap);


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
    if (effectQueue.isNotEmpty && children.query<Effect>().isEmpty) {
      add(effectQueue.removeAt(0));
    }
  }
}

// Moves the character one block up over 1 second
void moveForward() {
  llamaLocation = llamaLocation - 5;
  print("llamalocation = " + llamaLocation.toString());
  //effectQueue.add(MoveByEffect(Vector2(0, -(moveLength)), EffectController(duration: 1)));
  if(llamaLocation >= 0){
    print("move forward");
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength)), EffectController(duration: 1)));
  }else{
    print("bump");
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, (moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, (moveLength/10.0)), EffectController(duration: 0.25)));
  }
}

// Moves the character one block left over 1 second
void moveLeft() {
  llamaLocation = llamaLocation - 1;
  if((llamaLocation >= 0) && ((llamaLocation != 4) && (llamaLocation != 9) && (llamaLocation != 14) && (llamaLocation != 19))){
    effectQueue.add(MoveByEffect(Vector2(-(moveLength), 0), EffectController(duration: 1)));
  }else{
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
  }
  //effectQueue.add(MoveByEffect(Vector2(-(moveLength), 0), EffectController(duration: 1)));
}

// Moves the character one block right over 1 second
void moveRight() {
  llamaLocation = llamaLocation + 1;
  if((llamaLocation <= 24) && (llamaLocation != 5) && (llamaLocation != 10) && (llamaLocation != 15) && (llamaLocation != 20)){
    effectQueue.add(MoveByEffect(Vector2((moveLength), 0), EffectController(duration: 1)));
  }else{
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
  }
  //effectQueue.add(MoveByEffect(Vector2((moveLength), 0), EffectController(duration: 1)));
}

//Picks up the apple and checks solution
void pickUp(List instructions) {
  //removeApple = true;
  print("PICKUP");

  var isCorrect = CheckSolution(instructions, levelSolution);
  var correct = isCorrect.correct;

  if((correct == true) && (canPickUpApple = true)){
    removeApple = true;
    //effectQueue.add(removeApple = true);
  }
}

//gets the list of instructions and calls the movements to add to the character
void getMovements(List instructions){
  instructions.forEach((i) {
    if(i == "FORWARD"){
      moveForward();
    }
    else if(i == "LEFT"){
      moveLeft();
    }
    else if(i == "RIGHT"){
      moveRight();
    }
    else if(i == "PICKUP"){
      pickUp(instructions);
    };
  });
}