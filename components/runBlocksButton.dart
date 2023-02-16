import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../llama.dart';
import 'character.dart';
import 'spriteTextButton.dart';
import 'package:collection/collection.dart';


class RunBlocksButton extends SpriteComponent{
  var blocks = [];
  var newComponents = [];

  RunBlocksButton(Character character, List instructions){
    print("Run Blocks Button");
    print(instructions);
    //go through the list of instructions and send them to the correct function
    instructions.forEach((i){
      print(i);
      if(i == "FORWARD"){
        moveForward(character);
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
    character.add(MoveByEffect(Vector2(-90, 0), EffectController(duration: 1)),);
  }

  moveRight(Character character){
    character.add(MoveByEffect(Vector2(90, 0), EffectController(duration: 1)),);
  }

  pickUp(Character character){
    print("PICKUP");

  }

  isCorrect(List instructions){
    if(level == 1){
      print("instructions: " + instructions.toString());
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