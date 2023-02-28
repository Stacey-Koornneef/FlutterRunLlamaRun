import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../pieces/movementBlocks.dart';


class GetBlocks extends SpriteComponent{
  var blocks = [];

  GetBlocks(List instructions){
    print("in getBlocks");
    var yPosition = 120.0;
    instructions.forEach((i){
      print(i);
      //var name = "block" + i.toString();

      if(i == "FORWARD"){
        print("in forward");
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png')
          );
        blocks.add(name);
      }
      else if(i == "LEFT"){
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('leftBlock.png')
          );
        blocks.add(name);
      }
      else if(i == "RIGHT"){
        final name = MovementBlocks()
          ..position = Vector2(50, yPosition)
          ..scale = Vector2(3, 3)
          ..sprite = Sprite(Flame.images.fromCache('rightBlock.png')
          );
        blocks.add(name);
      }
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