import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../buttons/checkSolution.dart';
import '../../llama.dart';

/*
creates the character image and gives it movement
 */

final effectQueue = [];
var moveLength = (squareSide + squareGap);
bool applePickUp = false;
double timerNeeded = 0;
var countdown = Timer(0);
bool greenLlamaTime = false;
bool onPavement = true;
double greenTimerNeeded = 0;
var greenCountdown = Timer(0);
bool isGreen = false;


class Character extends SpriteAnimationComponent {
  //the list of llama walking sprites in order
  List<Sprite> runSprites = [
    Sprite(Flame.images.fromCache('llama_walk_back_1.png')),
    Sprite(Flame.images.fromCache('llama_walk_back_2.png')),
    Sprite(Flame.images.fromCache('llama_walk_back_3.png')),
    Sprite(Flame.images.fromCache('llama_walk_back_4.png')),
  ];

  //the list of llama walking sprites in order
  List<Sprite> runGreenSprites = [
    Sprite(Flame.images.fromCache('llama_green_1.png')),
    Sprite(Flame.images.fromCache('llama_green_2.png')),
    Sprite(Flame.images.fromCache('llama_green_3.png')),
    Sprite(Flame.images.fromCache('llama_green_4.png')),
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

    /*if(!pavementBlocks.contains(llamaLocation)){
      //print("Should be starting timer...");
      //greenCountdown = Timer(greenTimerNeeded);
      //greenLlamaTime = true;
      isGreen = true;
    }*/

    /*if(greenLlamaTime == true){
      //isGreen = true;
      print("greenTimerNeeded " + greenTimerNeeded.toString());
      print("greenLlamaTime = true and isGreen = false");
      greenCountdown.update(dt);
      print("greenCountdown: " + greenCountdown.current.toString());
      if(greenCountdown.finished){
        animation = SpriteAnimation.spriteList(runGreenSprites, stepTime: 0.5);
        runAnimation = SpriteAnimation.spriteList(runGreenSprites, stepTime: 0.5);
        greenLlamaTime = false;
        greenTimerNeeded = 0;
      }
      //animation = SpriteAnimation.spriteList(runGreenSprites, stepTime: 0.5);
      //runAnimation = SpriteAnimation.spriteList(runGreenSprites, stepTime: 0.5);
    }*/

    if (effectQueue.isNotEmpty && children.query<Effect>().isEmpty) {
      add(effectQueue.removeAt(0));
    }
    if(applePickUp == true){
      //removeApple = true;
      //applePickUp = false;
      countdown.update(dt);
      //print("countdown: " + countdown.current.toString());
        if(countdown.finished) {
          removeApple = true;
          applePickUp = false;
          timerNeeded = 0;
        }

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
    timerNeeded = timerNeeded + 1;
  }else{
    //makes the character bump the top if it goes out of board bounds
    print("bump");
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, (moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, (moveLength/10.0)), EffectController(duration: 0.25)));
    timerNeeded = timerNeeded + 1;
  }
  if(!pavementBlocks.contains(llamaLocation)){
    //print("Should be starting timer...");
    //greenCountdown = Timer(greenTimerNeeded);
    //greenLlamaTime = true;
    //isGreen = true;
    effectQueue.add(
      ColorEffect(
        Colors.green,
        const Offset(
          0.0,
          0.6,
        ), // Means, applies from 0% to 80% of the color
        EffectController(
          duration: 1.5,
          reverseDuration: 0,
          infinite: false,
        ),
      ),
    );
  }
}

// Moves the character one block left over 1 second
void moveLeft() {
  llamaLocation = llamaLocation - 1;

  /*if(!pavementBlocks.contains(llamaLocation)){
    //print("Should be starting timer...");
    greenCountdown = Timer(greenTimerNeeded);
    greenLlamaTime = true;
    isGreen = true;
  }*/

  if((llamaLocation >= 0) && ((llamaLocation != 4) && (llamaLocation != 9) && (llamaLocation != 14) && (llamaLocation != 19))){
    effectQueue.add(MoveByEffect(Vector2(-(moveLength), 0), EffectController(duration: 1)));
    timerNeeded = timerNeeded + 1;
    greenTimerNeeded = greenTimerNeeded + 1;
  }else{
    //makes the character bump the side if it goes out of board bounds
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    timerNeeded = timerNeeded + 1;
    greenTimerNeeded = greenTimerNeeded + 1;
  }

  if(!pavementBlocks.contains(llamaLocation)){
    //print("Should be starting timer...");
    //greenCountdown = Timer(greenTimerNeeded);
    //greenLlamaTime = true;
    //isGreen = true;
    effectQueue.add(
      ColorEffect(
        Colors.green,
        const Offset(
          0.0,
          0.6,
        ), // Means, applies from 0% to 80% of the color
        EffectController(
          duration: 1.5,
          reverseDuration: 0,
          infinite: false,
        ),
      ),
    );
  }
  //effectQueue.add(MoveByEffect(Vector2(-(moveLength), 0), EffectController(duration: 1)));
}

// Moves the character one block right over 1 second
void moveRight() {
  llamaLocation = llamaLocation + 1;

  /*if(!pavementBlocks.contains(llamaLocation)){
    //print("Should be starting timer...");
    greenCountdown = Timer(greenTimerNeeded);
    greenLlamaTime = true;
    isGreen = true;
  }*/

  if((llamaLocation <= 24) && (llamaLocation != 5) && (llamaLocation != 10) && (llamaLocation != 15) && (llamaLocation != 20)){
    effectQueue.add(MoveByEffect(Vector2((moveLength), 0), EffectController(duration: 1)));
    timerNeeded = timerNeeded + 1;
    greenTimerNeeded = greenTimerNeeded + 1;
  }else{
    //make character bump the side if it goes out of board bounds
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2((moveLength/10.0), 0), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(-(moveLength/10.0), 0), EffectController(duration: 0.25)));
    timerNeeded = timerNeeded + 1;
    greenTimerNeeded = greenTimerNeeded + 1;
  }

  if(!pavementBlocks.contains(llamaLocation)){
    //print("Should be starting timer...");
    //greenCountdown = Timer(greenTimerNeeded);
    //greenLlamaTime = true;
    //isGreen = true;
    effectQueue.add(
      ColorEffect(
        Colors.green,
        const Offset(
          0.0,
          0.6,
        ), // Means, applies from 0% to 80% of the color
        EffectController(
          duration: 1.5,
          reverseDuration: 0,
          infinite: false,
        ),
      ),
    );
  }
  //effectQueue.add(MoveByEffect(Vector2((moveLength), 0), EffectController(duration: 1)));
}

//Picks up the apple and checks solution
void pickUp(List instructions) {
  //removeApple = true;
  /*print("PICKUP");

  var isCorrect = CheckSolution(instructions, levelSolution);
  var correct = isCorrect.correct;

  if((correct == true) && (canPickUpApple = true)){
    removeApple = true;
    //effectQueue.add(removeApple = true);
  }*/
  print("llamalocation = " + llamaLocation.toString());
  print("applelocation = " + appleLocation.toString());
  if((llamaLocation == appleLocation)){
    //removeApple = true;
    //llama jumps to pick up the apple
    effectQueue.add(MoveByEffect(Vector2(0, 0), EffectController(duration: 0.5)));
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, (moveLength/10.0)), EffectController(duration: 0.25)));
    timerNeeded = timerNeeded + 0.75;
    /*while(effectQueue.isNotEmpty) {
      print("in while");
    }*/
    print("timerNeeded: " + timerNeeded.toString());
    countdown = Timer(timerNeeded);
    //removeApple = true;
    applePickUp = true;

  }else{
    //llama jumps to pick up the apple
    //appleAvailable = false;
    effectQueue.add(MoveByEffect(Vector2(0, 0), EffectController(duration: 0.5)));
    effectQueue.add(MoveByEffect(Vector2(0, -(moveLength/10.0)), EffectController(duration: 0.25)));
    effectQueue.add(MoveByEffect(Vector2(0, (moveLength/10.0)), EffectController(duration: 0.25)));
  }

}


//gets the list of instructions and calls the movements to add to the character
void getMovements(List instructions){
  var count = 0;
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
    /*if(!pavementBlocks.contains(llamaLocation) && count == 0){
      print("Should be starting timer...");
      //greenCountdown = Timer(greenTimerNeeded-1);
      greenLlamaTime = true;
      count += 1;
    }*/
  });
  //checks to see if the list of instructions is the correct solution


  CheckSolution(instructions, levelSolution);
}