import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../pieces/movementBlocks.dart';

/*
this class does everything relating to adding the instruction blocks to the main
app screen
 */
class GetBlocks extends SpriteComponent{
  //the list of blocks that can be accessed in llama.dart
  var blocks = [];

  /*
  goes through each instruction and creates the matching block
   */
  GetBlocks(List instructions){
    print("in getBlocks");
    var yPosition = 120.0;
    instructions.forEach((i){
      print(i);
      if(i == "FORWARD"){
        print("in forward");
        //makes the forward block
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png')
          );
        blocks.add(name);
      }
      //makes the left block
      else if(i == "LEFT"){
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('leftBlock.png')
          );
        blocks.add(name);
      }
      //makes the right block
      else if(i == "RIGHT"){
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('rightBlock.png')
          );
        blocks.add(name);
      }
      //makes the pick up block
      else if(i == "PICKUP"){
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('pickUpBlock.png')
          );
        blocks.add(name);
      };
      yPosition = yPosition + 75;
    });

  }

}