import 'dart:io';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../llama.dart';
import 'movementBlocks.dart';
import 'character.dart';
import 'package:flame/timer.dart';
import 'spriteTextButton.dart';
import 'levelTwo.dart';
import 'package:collection/collection.dart';


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

      isCorrect(instructions);

    });





  }

  //moves the character one block up over 1 second
  moveForward(Character character){
    print("in moveforward");
    character.add(MoveByEffect(Vector2(0, -90), EffectController(duration: 1)),);

  }

  //moves the character to the block on the left over 1 second
  moveLeft(Character character){
    print("in moveleft");
    //character.add(RotateEffect.by(pi/2, EffectController(duration: 0.5)));
    character.add(MoveByEffect(Vector2(-90, 0), EffectController(duration: 1)),);
    //character.add(RotateEffect.by(pi/2, EffectController(duration: 0.5)));
  }

  moveRight(Character character){
    character.add(MoveByEffect(Vector2(90, 0), EffectController(duration: 1)),);
  }

  pickUp(Character character){
    print("PICKUP");

  }

  isCorrect(List instructions){
    print("in is correct");
    if(level == 1){
      print("in level loop");
      print("instructions: " + instructions.toString());
      //print(instructions.runtimeType);
      var testResult = (instructions == ["FORWARD", "FORWARD", "PICKUP"]);
      print("instructions are correct: " + testResult.toString());
      Function equality = const DeepCollectionEquality().equals;
      print(equality(instructions, ["FORWARD", "FORWARD", "PICKUP"]));
      if(equality(instructions, ["FORWARD", "FORWARD", "PICKUP"])){
        print("in instructions loop");
        var continueButton = SpriteTextButton(
          button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
          priority: 200,
          scale: Vector2(0.1,0.1),
          position: Vector2(50,400),
          onPressed: () {
            //removeAll(components);
            print("Continuing");
            //level = 2;
            /*for(var element in levelTwoBlocks){
              newComponents.add(element);
            }*/
            level = level + 1;
            reset = true;
          },
          text: "Continue",
          textXShift: 600,
          textYShift: -200,
        );

        newComponents.add(continueButton);
      }
    }
  }





}