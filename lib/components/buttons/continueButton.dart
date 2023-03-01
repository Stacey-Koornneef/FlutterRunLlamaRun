
import 'spriteTextButton.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../../llama.dart';


class ContinueButton{

  //var blocks = [];
  var continueButton;

  ContinueButton(){
    addContinueButton = true;

    continueButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 1000,
      scale: Vector2(0.1,0.1),
      position: Vector2(50,450),
      onPressed: () {
        level = level + 1;
        reset = true;
      },
      text: "Continue",
      textXShift: 600,
      textYShift: -200,
    );

    //blocks.add(continueButton);

  }
}