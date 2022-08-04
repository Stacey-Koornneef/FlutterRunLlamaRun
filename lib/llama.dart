import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/character.dart';
import 'components/board.dart';
import 'components/grassBlocks.dart';
import 'components/pavementBlocks.dart';
import 'components/apple.dart';
import 'components/levelOne.dart';
import 'components/spriteTextButton.dart';
import 'components/getBlocks.dart';
import 'components/movementBlocks.dart';


class LlamaGame extends FlameGame with HasTappables {
  static const double squareWidth = 1000.0;
  static const double squareHeight = 1000.0;
  static const double squareGap = 175.0;
  static const double squareRadius = 100.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);
  int level = 1;
  SpriteTextButton? getBlocksButton;

  List<Component> components = [];
  //final world = World();
  bool getBlocksRun = false;


  @override
  Future<void> onLoad() async {
    //await Flame.device.fullScreen();
    //await Flame.device.setOrientation(DeviceOrientation.landscapeRight);
    await Flame.images.loadAll(<String>[
      'llama_walk_back_1.png',
      'llama_walk_back_2.png',
      'llama_walk_back_3.png',
      'llama_walk_back_4.png',
      'mygrasslarge.jpg',
      'mypavementlarge.jpg',
      'apple.png',
      'buttonBackground1.png',
      'forwardBlock.png',
      'leftBlock.png',
      'rightBlock.png',
      'pickUpBlock.png'
    ]);

    getBlocksButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 5,
      scale: Vector2(0.75,0.75),
      position: Vector2(50,30),
      onPressed: () {
        print("Get Blocks");
        LevelOne();
        final blockOne = MovementBlocks()
          ..position = Vector2(25, 100)
          ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png')
          );
        components.add(blockOne);
        add(blockOne);

        final blockTwo = MovementBlocks()
          ..position = Vector2(25, 200)
          ..sprite = Sprite(Flame.images.fromCache('forwardBlock.png'));
        components.add(blockOne);
        add(blockTwo);

        final blockThree = MovementBlocks()
          ..position = Vector2(25, 300)
          ..sprite = Sprite(Flame.images.fromCache('pickUpBlock.png'));
        components.add(blockOne);
        add(blockThree);

        //world.overlay.add(blockOne);
      },
      text: "Get Blocks",
      textXShift: 400,
      textYShift: 100,
    );



    final character = Character()
      ..size = squareSize
      ..position = Vector2(
        squareGap + (0+4) * (squareWidth + squareGap),
        (squareHeight*4) + 5 * squareGap,);
      //..position = Vector2(squareGap, squareGap);
    components.add(character);

    final apple = Apple()
      ..size = Vector2(squareHeight/4, squareHeight/4)
      ..position = Vector2( squareGap + (0+4.3) * (squareWidth + squareGap),
        (squareHeight*2.5) + 3 * squareGap,);

    components.add(apple);
    //final blocks = LevelOne();

     final blocks5 = List.generate(
      5,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position =
        Vector2((i + 2) * (squareWidth + squareGap) + squareGap, squareGap),
    );

    final blocks4 = List.generate(
      5,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+2) * (squareWidth + squareGap),
          squareHeight + 2 * squareGap,),
    );
    final blocks3P1 = List.generate(
      2,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+2) * (squareWidth + squareGap),
          (squareHeight*2) + 3 * squareGap,),
    );
    final blocks3P2 = List.generate(
      1,
          (i) => PavementBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+4) * (squareWidth + squareGap),
          (squareHeight*2) + 3 * squareGap,),
    );
    final blocks3P3 = List.generate(
      2,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+5) * (squareWidth + squareGap),
          (squareHeight*2) + 3 * squareGap,),
    );
    final blocks2P1 = List.generate(
      2,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+2) * (squareWidth + squareGap),
          (squareHeight*3) + 4 * squareGap,),
    );
    final blocks2P2 = List.generate(
      1,
          (i) => PavementBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+4) * (squareWidth + squareGap),
          (squareHeight*3) + 4 * squareGap,),
    );
    final blocks2P3 = List.generate(
      2,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+5) * (squareWidth + squareGap),
          (squareHeight*3) + 4 * squareGap,),
    );
    final blocks1P1 = List.generate(
      2,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+2) * (squareWidth + squareGap),
          (squareHeight*4) + 5 * squareGap,),
    );
    final blocks1P2 = List.generate(
      1,
          (i) => PavementBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+4) * (squareWidth + squareGap),
          (squareHeight*4) + 5 * squareGap,),
    );
    final blocks1P3 = List.generate(
      2,
          (i) => GrassBlocks()
        ..size = squareSize
        ..position = Vector2(
          squareGap + (i+5) * (squareWidth + squareGap),
          (squareHeight*4) + 5 * squareGap,),
    );



    final world = World()
      //..add(blocks)
      //..add(character)
      //..add(apple)
      ..addAll(components)
      //..add(blocks);
      ..addAll(blocks5)
        ..addAll(blocks4)
        ..addAll(blocks3P1)
        ..addAll(blocks3P2)
        ..addAll(blocks3P3)
        ..addAll(blocks2P1)
        ..addAll(blocks2P2)
        ..addAll(blocks2P3)
        ..addAll(blocks1P1)
        ..addAll(blocks1P2)
        ..addAll(blocks1P3)
      ..add(getBlocksButton!);

    add(world);

    final camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize =
      Vector2(squareWidth * 7 + squareGap * 8, 4 * squareHeight + 3 * squareGap)
      ..viewfinder.position = Vector2(squareWidth * 3.5 + squareGap * 4, 0)
      ..viewfinder.anchor = Anchor.topCenter;
    add(camera);

  }


}




