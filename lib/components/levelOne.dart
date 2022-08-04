import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'grassBlocks.dart';
import 'package:flame/experimental.dart';
import 'pavementBlocks.dart';

class LevelOne  {
  static const double squareWidth = 1000.0;
  static const double squareHeight = 1000.0;
  static const double squareGap = 175.0;
  static const double squareRadius = 100.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);

  final grassBlocks = <GrassBlocks>[];
  final pavementBlocks = <PavementBlocks>[];

  var blocks = [];

  //var blocks = new List();


  levelOne(){
    final B00 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2((0 + 2) * (squareWidth + squareGap) + squareGap, squareGap);

    //grassBlocks.add(B00);
    blocks.add(B00);

    final B01 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2((1 + 2) * (squareWidth + squareGap) + squareGap, squareGap);

    blocks.add(B01);

    final B02 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2((2 + 2) * (squareWidth + squareGap) + squareGap, squareGap);

    blocks.add(B02);

    final B03 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2((3 + 2) * (squareWidth + squareGap) + squareGap, squareGap);

    blocks.add(B03);

    final B04 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2((4 + 2) * (squareWidth + squareGap) + squareGap, squareGap);

    blocks.add(B04);

    final B10 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (0+2) * (squareWidth + squareGap),
        squareHeight + 2 * squareGap,);

    blocks.add(B10);

    final B11 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (1+2) * (squareWidth + squareGap),
        squareHeight + 2 * squareGap,);

    blocks.add(B11);

    final B12 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (2+2) * (squareWidth + squareGap),
        squareHeight + 2 * squareGap,);

    blocks.add(B12);

    final B13 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (3+2) * (squareWidth + squareGap),
        squareHeight + 2 * squareGap,);

    blocks.add(B13);

    final B14 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (4+2) * (squareWidth + squareGap),
        squareHeight + 2 * squareGap,);

    blocks.add(B14);

    final B20 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (0+2) * (squareWidth + squareGap),
        (squareHeight*2) + 3 * squareGap,);

    blocks.add(B20);

    final B21 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (1+2) * (squareWidth + squareGap),
        (squareHeight*2) + 3 * squareGap,);

    blocks.add(B21);

    final B22 = PavementBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (2+2) * (squareWidth + squareGap),
        (squareHeight*2) + 3 * squareGap,);

    blocks.add(B22);

    final B23 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (3+2) * (squareWidth + squareGap),
        (squareHeight*2) + 3 * squareGap,);

    blocks.add(B23);

    final B24 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (4+2) * (squareWidth + squareGap),
        (squareHeight*2) + 3 * squareGap,);

    blocks.add(B24);

    final B30 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (0+2) * (squareWidth + squareGap),
        (squareHeight*3) + 4 * squareGap,);

    blocks.add(B30);

    final B31 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (1+2) * (squareWidth + squareGap),
        (squareHeight*3) + 4 * squareGap,);

    blocks.add(B31);

    final B32 = PavementBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (2+2) * (squareWidth + squareGap),
        (squareHeight*3) + 4 * squareGap,);

    blocks.add(B32);

    final B33 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (3+2) * (squareWidth + squareGap),
        (squareHeight*3) + 4 * squareGap,);

    blocks.add(B33);

    final B34 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (4+2) * (squareWidth + squareGap),
        (squareHeight*3) + 4 * squareGap,);

    blocks.add(B34);

    final B40 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (0+2) * (squareWidth + squareGap),
        (squareHeight*4) + 5 * squareGap,);

    blocks.add(B40);

    final B41 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (1+2) * (squareWidth + squareGap),
        (squareHeight*4) + 5 * squareGap,);

    blocks.add(B41);

    final B42 = PavementBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (2+2) * (squareWidth + squareGap),
        (squareHeight*4) + 5 * squareGap,);

    blocks.add(B42);

    final B43 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (3+2) * (squareWidth + squareGap),
        (squareHeight*4) + 5 * squareGap,);

    blocks.add(B43);

    final B44 = GrassBlocks()
      ..size = squareSize
      ..position = Vector2(squareGap + (4+2) * (squareWidth + squareGap),
        (squareHeight*4) + 5 * squareGap,);

    blocks.add(B44);
    print(blocks);

  }






}