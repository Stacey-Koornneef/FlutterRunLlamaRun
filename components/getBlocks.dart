import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'movementBlocks.dart';


class GetBlocks extends SpriteComponent{
  var blocks = [];

  GetBlocks(List instructions){
    instructions.forEach((i){
      print(i);

      if(i == "FORWARD"){

      }
      else if(i == "LEFT"){

      }
      else if(i == "RIGHT"){

      }
      else if(i == "PICKUP"){
        
      };

    });

    print("Get Blocks");
    final blockOne = MovementBlocks()
      ..position = Vector2(50, 200)
      ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png')
      );
    blocks.add(blockOne);

    final blockTwo = MovementBlocks()
      ..position = Vector2(50, 300)
      ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png'));
    blocks.add(blockTwo);

    final blockThree = MovementBlocks()
      ..position = Vector2(50, 400)
      ..sprite = Sprite(Flame.images.fromCache('pickUpBlock.png'));
    blocks.add(blockThree);
  }



}