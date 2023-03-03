import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import '../../llama.dart';
import '../pieces/character.dart';
import 'checkSolution.dart';

/*
all functionality relating to running the instructions, ie making the llama move
 */
class RunBlocksButton extends SpriteComponent{
  var blocks = [];
  var newComponents = [];

  /*
  goes through the list of instructions and directs each instruction to the correct
  movement function and then checks if the solution is correct
   */
  RunBlocksButton(Character character, List instructions){
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

      //TODO move this so that it only happens at the end of the list
      CheckSolution(instructions, levelSolution);

    });

  }

  //moves the character one block up over 1 second
  Future moveForward(Character character) async{
    print("in moveforward");
    character.add(MoveByEffect(Vector2(0, -90), EffectController(duration: 1)),);

  }

  //moves the character to the block on the left over 1 second
  Future moveLeft(Character character) async{
    print("in moveleft");
    character.add(MoveByEffect(Vector2(-90, 0), EffectController(duration: 1)),);
  }

  //moves the character to the block on the right over 1 second
  moveRight(Character character){
    character.add(MoveByEffect(Vector2(90, 0), EffectController(duration: 1)),);
  }

  //the pick up block, removes the apple
  //TODO CHECK IF THE FUTURE WORKS
  Future pickUp(Character character) async{
    removeApple = true;
    print("PICKUP");

  }

  }





