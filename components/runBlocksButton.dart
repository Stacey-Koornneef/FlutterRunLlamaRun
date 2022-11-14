import 'dart:io';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'movementBlocks.dart';
import 'character.dart';
import 'package:flame/timer.dart';
import 'spriteTextButton.dart';
import 'levelTwo.dart';


class RunBlocksButton extends SpriteComponent{
  var blocks = [];
  var newComponents = [];

  RunBlocksButton(Character character, List instructions){
    print("Run Blocks Button");
    print(instructions);
    //character.add(MoveByEffect(Vector2(0, -1200), EffectController(duration: 1)),);

    //go through the list of instructions and send them to the correct function
    instructions.forEach((i){
      print(i);

      if(i == "FORWARD"){
        //Timer(7.0, onTick: () {
        moveForward(character);
        //});

        //sleep(const Duration(seconds: 2));
        //Duration timeDuration = Duration(seconds: 3);
        // sleep(timeDuration)
        //await Future.delayed(timeDuration);
      }
      else if(i == "LEFT"){
        moveLeft(character);
      }
      else if(i == "RIGHT"){
        moveRight(character);
      }
      else if(i == "PICKUP"){
        pickUp(character);
      };

    });





  }

  //moves the character one block up over 1 second
  moveForward(Character character){
    print("in moveforward");
    character.add(MoveByEffect(Vector2(0, -700), EffectController(duration: 1)),);

  }

  //moves the character to the block on the left over 1 second
  moveLeft(Character character){
    print("in moveleft");
    //character.add(RotateEffect.by(pi/2, EffectController(duration: 0.5)));
    character.add(MoveByEffect(Vector2(-600, 0), EffectController(duration: 1)),);
    //character.add(RotateEffect.by(pi/2, EffectController(duration: 0.5)));
  }

  moveRight(Character character){
    character.add(MoveByEffect(Vector2(600, 0), EffectController(duration: 1)),);
  }

  pickUp(Character character){
    print("PICKUP");

    var continueButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 200,
      scale: Vector2(0.075,0.075),
      position: Vector2(25,15),
      onPressed: () {
        print("Continuing");
        var newBoard = [];
        var levelTwo = LevelTwo();
        var levelTwoBlocks = levelTwo.blocks;
        for(var element in levelTwoBlocks){
          newComponents.add(element);
        }
      },
      text: "Continue",
      textXShift: 250,
      textYShift: 50,
    );

    newComponents.add(continueButton);
  }





}