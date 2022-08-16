import 'dart:io';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'movementBlocks.dart';
import 'character.dart';
import 'package:flame/timer.dart';


class RunBlocksButton extends SpriteComponent{
  var blocks = [];

  RunBlocksButton(Character character, List instructions){
    print("Run Blocks Button");
    print(instructions);
    //character.add(MoveByEffect(Vector2(0, -1200), EffectController(duration: 1)),);

    //go through the list of instructions and send them to the correct function
    instructions.forEach((i) async {
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
    character.add(MoveByEffect(Vector2(0, -1200), EffectController(duration: 1)),);

  }

  //moves the character to the block on the left over 1 second
  moveLeft(Character character){
    print("in moveleft");
    //character.add(RotateEffect.by(pi/2, EffectController(duration: 0.5)));
    character.add(MoveByEffect(Vector2(-1200, 0), EffectController(duration: 1)),);
    //character.add(RotateEffect.by(pi/2, EffectController(duration: 0.5)));
  }

  moveRight(Character character){
    character.add(MoveByEffect(Vector2(1200, 0), EffectController(duration: 1)),);
  }

  pickUp(Character character){
    print("PICKUP");
  }





}