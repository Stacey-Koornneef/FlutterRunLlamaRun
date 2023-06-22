
import 'spriteTextButton.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../../llama.dart';

/*
creates and controls all functionality for the try again button
 */
class TryAgainButton{

  //allows the button to be accessed by llama.dart
  var tryAgainButton;

  /*
  creates and controls all functionality for the try again button
   */
  TryAgainButton(){
    addTryAgainButton = true;

    tryAgainButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 200,
      scale: Vector2(0.1,0.1),
      position: continueButtonPosition,
      onPressed: () {
        //resets the board without changing the level
        reset = true;
      },
      text: "Try Again",
      textXShift: 600,
      textYShift: -200,
    );
  }

}