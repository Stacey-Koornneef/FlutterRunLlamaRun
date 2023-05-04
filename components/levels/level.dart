import 'package:flame/components.dart';

import '../pieces/grassBlocks.dart';
import '../pieces/pavementBlocks.dart';
import '../pieces/character.dart';
import '../pieces/apple.dart';
import '../../llama.dart';

/*
the class responsibile for making all levels, including the apple, character,
various blocks, and the solution
 */
class Level {
  //sizing for the blocks
  /*static const double squareWidth = 80;
  static const double squareHeight = 80;
  static const double squareGap = 3;
  static const double squareRadius = 3.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);*/

  //final grassBlocks = <GrassBlocks>[];
  //final pavementBlocks = <PavementBlocks>[];

  //allows the blocks, solution, apple, and character to be accessed by llama.dart
  var blocks = [];
  var solution = [];
  var character;
  var apple;

  /*
  creates the basic board of grass blocks, then adjusts in the different levels
   */
  Level(int level){
    print("in level");

    //creates a 5 by 5 grid of grass blocks
    /* Indexing positions:
    0   1   2   3   4
    5   6   7   8   9
    10  11  12  13  14
    15  16  17  18  19
    20  21  22  23  24
     */
    for(var y = 0; y <= 4; y++){
      for(var x = 0; x <= 4 ; x++){
        var createBlock = GrassBlocks()
            ..size = squareSize
          //..position = Vector2(((2+x)+2) *(squareSide + squareGap) + squareGap,
        //                 (squareSide * (y)) + ((y+0.5) * squareGap));
            ..position = Vector2(((4+x)+2) *(squareSide + squareGap) + squareGap,
                (squareSide * (y)) + ((y+0.5) * squareGap));

        blocks.add(createBlock);
      }

    }

    //send to correct level
    if(level == 1){
      LevelOne();
    }else if(level == 2){
      LevelTwo();
    }else if(level == 3){
      LevelThree();
    }else if(level == 4){
      LevelFour();
    }





  }

  /*
  adjusts the board for level 1 and adds the character and apple and defines the
  solution
   */
  LevelOne(){
    var b1 = PavementBlocks()
        ..size = squareSize
        .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (4)) + ((4+0.5) * squareGap));

    blocks.removeAt(22);
    blocks.insert(22, b1);

    var b2 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(17);
    blocks.insert(17, b2);

    var b3 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(12);
    blocks.insert(12, b3);

    print(blocks);

    character = Character()
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + ((6.65-1)+2) * (squareSide + squareGap),
        (squareSide*3.7) + 3 * squareGap,);
    //blocks.add(character);

    apple = Apple()
      ..size = Vector2(squareSide/2, squareSide/2)
      ..position = Vector2(squareGap + ((8.25-1)+1) * (squareSide + squareGap),
        (squareSide*2.3) + 2.5 * squareGap,);

    //blocks.add(apple);

    solution = ["FORWARD", "FORWARD", "PICKUP"];

  }

  /*
  adjusts the board for level 2 and adds the character and apple and defines the
  solution
   */
  LevelTwo(){
    var b1 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (4)) + ((4+0.5) * squareGap));

    blocks.removeAt(22);
    blocks.insert(22, b1);

    var b2 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(17);
    blocks.insert(17, b2);

    var b3 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(12);
    blocks.insert(12, b3);

    var b4 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+1)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(11);
    blocks.insert(11, b4);

    var b5 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+0)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(10);
    blocks.insert(10, b5);

    print(blocks);

    character = Character()
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + ((6.65-1)+2) * (squareSide + squareGap),
        (squareSide*3.7) + 3 * squareGap,);
    //blocks.add(character);

    apple = Apple()
      ..size = Vector2(squareSide/2, squareSide/2)
      ..position = Vector2(squareGap + ((6.25-1)+1) * (squareSide + squareGap),
        (squareSide*2.3) + 2.5 * squareGap,);

    //blocks.add(apple);

    solution = ["FORWARD", "FORWARD","LEFT", "LEFT", "PICKUP"];

  }

  /*
  adjusts the board for level 3 and adds the character and apple and defines the
  solution
   */
  LevelThree(){
    var b1 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (4)) + ((4+0.5) * squareGap));

    blocks.removeAt(22);
    blocks.insert(22, b1);

    var b2 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+1)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (4)) + ((4+0.5) * squareGap));

    blocks.removeAt(21);
    blocks.insert(21, b2);

    var b3 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+1)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(16);
    blocks.insert(16, b3);

    var b4 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+1)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(11);
    blocks.insert(11, b4);

    var b5 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(12);
    blocks.insert(12, b5);

    var b6 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+3)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(13);
    blocks.insert(13, b6);


    print(blocks);

    character = Character()
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + ((6.65-1)+2) * (squareSide + squareGap),
        (squareSide*3.7) + 3 * squareGap,);
    //blocks.add(character);

    apple = Apple()
      ..size = Vector2(squareSide/2, squareSide/2)
      ..position = Vector2(squareGap + ((8.25-1)+1) * (squareSide + squareGap),
        (squareSide*2.3) + 2.5 * squareGap,);

    //blocks.add(apple);

    solution = ["LEFT", "FORWARD","FORWARD", "RIGHT", "PICKUP"];

  }

  /*
  adjusts the board for level 4 and adds the character and apple and defines the
  solution
   */
  LevelFour(){
    var b1 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (4)) + ((4+0.5) * squareGap));

    blocks.removeAt(22);
    blocks.insert(22, b1);

    var b2 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(17);
    blocks.insert(17, b2);

    var b3 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (2)) + ((2+0.5) * squareGap));

    blocks.removeAt(12);
    blocks.insert(12, b3);

    var b4 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+2)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (1)) + ((1+0.5) * squareGap));

    blocks.removeAt(7);
    blocks.insert(7, b4);

    var b5 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+1)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(16);
    blocks.insert(16, b5);

    var b6 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+0)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(15);
    blocks.insert(15, b6);

    var b7 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+3)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(18);
    blocks.insert(18, b7);

    var b8 = PavementBlocks()
      ..size = squareSize
      .. position = Vector2(((4+4)+2) *(squareSide + squareGap) + squareGap,
          (squareSide * (3)) + ((3+0.5) * squareGap));

    blocks.removeAt(19);
    blocks.insert(19, b8);

    print(blocks);

    character = Character()
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + ((6.65-1)+2) * (squareSide + squareGap),
        (squareSide*3.7) + 3 * squareGap,);
    //blocks.add(character);

    apple = Apple()
      ..size = Vector2(squareSide/2, squareSide/2)
      ..position = Vector2(squareGap + ((10.25-1)+1) * (squareSide + squareGap),
        (squareSide*3.3) + 1.5 * squareGap,);

    //blocks.add(apple);

    solution = ["FORWARD", "RIGHT", "RIGHT", "PICKUP"];

  }

}

