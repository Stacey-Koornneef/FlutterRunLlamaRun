
import 'spriteTextButton.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import '../../llama.dart';


class TryAgainButton{

  var tryAgainButton;

  TryAgainButton(){
    addTryAgainButton = true;

    tryAgainButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 200,
      scale: Vector2(0.1,0.1),
      position: Vector2(50,450),
      onPressed: () {
        reset = true;
      },
      text: "Try Again",
      textXShift: 600,
      textYShift: -200,
    );
  }

}