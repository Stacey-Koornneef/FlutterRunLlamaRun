
import 'spriteTextButton.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../../llama.dart';


/*
makes the continue button and its functionality
 */
class ContinueButton{

  //the variable for the continue button that can be accessed by llama.dart
  var continueButton;

  /*
  makes the button and has the button's functionality
   */
  ContinueButton(){
    addContinueButton = true;

    continueButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 1000,
      scale: Vector2(0.1,0.1),
      position: Vector2(50,450),
      onPressed: () {
        //increases level
        level = level + 1;
        //resets the board to move to the next level
        reset = true;
      },
      text: "Continue",
      textXShift: 600,
      textYShift: -200,
    );

    //blocks.add(continueButton);

  }
}