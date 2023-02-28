import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import '../pieces/grassBlocks.dart';
import 'package:flame/experimental.dart';
import '../pieces/pavementBlocks.dart';
import '../pieces/character.dart';
import '../pieces/apple.dart';

class Level {
  static const double squareWidth = 80;
  static const double squareHeight = 80;
  static const double squareGap = 3;
  static const double squareRadius = 3.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);

  final grassBlocks = <GrassBlocks>[];
  final pavementBlocks = <PavementBlocks>[];



  //Iterable? blocks;
  var blocks = [];
  var solution = [];

  Level(int level){
    print("in level");
    /*for(var x = 0; x <= 4; x++){
      var createBlock = GrassBlocks()
          ..size = squareSize
          .. position = Vector2(((2+x)+2) *(squareWidth + squareGap) + squareGap, squareGap);*/
    for(var y = 0; y <= 4; y++){
      for(var x = 0; x <= 4 ; x++){
        var createBlock = GrassBlocks()
            ..size = squareSize
            ..position = Vector2(((2+x)+2) *(squareWidth + squareGap) + squareGap,
                (squareHeight * (y)) + ((y+0.5) * squareGap));

        blocks.add(createBlock);
      }

    }

    if(level == 1){
      LevelOne();
    }else if(level == 2){
      LevelTwo();
    }





  }

  LevelOne(){
    var b1 = PavementBlocks()
        ..size = squareSize
        .. position = Vector2(((2+4)+2) *(squareWidth + squareGap) + squareGap,
          (squareHeight * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(22);
    blocks.insert(22, b1);

    print(blocks);

    final character = Character()
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + ((4.65-1)+2) * (squareWidth + squareGap),
        (squareHeight*3.7) + 3 * squareGap,);
    blocks.add(character);

    final apple = Apple()
      ..size = Vector2(squareHeight/2, squareHeight/2)
      ..position = Vector2(squareGap + ((6.25-1)+1) * (squareWidth + squareGap),
        (squareHeight*2.3) + 2.5 * squareGap,);

    blocks.add(apple);

  }

  LevelTwo(){

  }
}

