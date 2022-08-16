import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'movementBlocks.dart';


class GetBlocks extends SpriteComponent{
  var blocks = [];

  GetBlocks(){
    print("Get Blocks");
    final blockOne = MovementBlocks()
      ..position = Vector2(25, 100)
      ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png')
      );
    blocks.add(blockOne);

    final blockTwo = MovementBlocks()
      ..position = Vector2(25, 200)
      ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png'));
    blocks.add(blockTwo);

    final blockThree = MovementBlocks()
      ..position = Vector2(25, 300)
      ..sprite = Sprite(Flame.images.fromCache('pickUpBlock.png'));
    blocks.add(blockThree);
  }



}