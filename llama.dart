import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/character.dart';
//import 'components/board.dart';
import 'components/grassBlocks.dart';
import 'components/pavementBlocks.dart';
import 'components/apple.dart';
import 'components/levelOne.dart';
import 'components/levelTwo.dart';
import 'components/spriteTextButton.dart';
import 'components/getBlocks.dart';
import 'components/movementBlocks.dart';
import 'components/runBlocksButton.dart';
import 'components/textRecognition2.dart';

class LlamaGame extends FlameGame with HasTappables {
  //setting up board
  static const double squareWidth = 80;
  static const double squareHeight = 80;
  static const double squareGap = 3;
  static const double squareRadius = 3.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);
  int level = 1;
  SpriteTextButton? getBlocksButton;
  SpriteTextButton? runBlocksButton;

  List<Component> components = [];
  //final world = World();
  //for checking when the buttons have run
  bool getBlocksRun = false;
  bool runBlocksRunning = false;

  //var instructions = ["FORWARD","FORWARD","PICKUP"];
  var testInstructions = ["FORWARD", "LEFT", "RIGHT"];
  //var instructions = [];
  var newInstructions = [];

  @override
  Color backgroundColor() => const Color(0x00000000);


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
      scale: Vector2(0.1,0.1),
      position: Vector2(50,30),
      onPressed: () {
        getBlocksRun = true;
        print("Get Blocks");

        //var getBlocks = GetBlocks(instructions);
        var response = TextRecognition2();
        print("response after text recognition: " + response.toString());
        var result = response.instructions;
        print("INSTRUCTIONS: " + result.toString());
        //instructions = ["FORWARD"];
        for( var i in result){
          newInstructions.add(i);
        }
        print("llama instructions = " + newInstructions.toString());
        var getBlocks = GetBlocks(newInstructions);
        var getBlocksList = getBlocks.blocks;
        //world.overlay.add(blockOne);

        for(var element in getBlocksList){
          add(element);
        }
      },
      text: "Get Blocks",
      textXShift: 400,
      textYShift: 100,
    );
    add(getBlocksButton!);

    final character = Character()
    //..size = (squareSize*1.75)
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + (4.65+2) * (squareWidth + squareGap),
        (squareHeight*3.7) + 3 * squareGap,);
    //Vector2(squareGap + (6+2) * (squareWidth + squareGap),
      //(squareHeight*4) + 3 * squareGap,);


    //add(character);

    runBlocksButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 6,
      scale: Vector2(0.1,0.1),
      position: Vector2(495, 425),
      onPressed: () {
        print("Run Blocks");
        if(getBlocksRun == true){
          var getComponents = RunBlocksButton(character, newInstructions);
          var newComponents = getComponents.newComponents;
          for(var element in newComponents){
            add(element);
          }

        }
      },
      text: "Run, Llama, Run",
      textXShift: -430,
      textYShift: -250,
    );

    add(runBlocksButton!);



    var levelOne = LevelOne();
    var levelOneBlocks = levelOne.blocks;

    //var levelTwo = LevelTwo();
    //var levelTwoBlocks = levelTwo.blocks;


    // final world = World()
    //..add(blocks)
    // ..add(character)
    add(character);
    addAll(components);
    //add(runBlocksButton!);
    // //..add(apple)
    // ..addAll(components)
    // //..add(getBlocksButton!)
    // ..add(runBlocksButton!);
    //..addAll(levelOneBlocks);
    //print(levelOneBlocks);
    for(var element in levelOneBlocks){
      // world.add(element);
      add(element);
    }


    // add(world);
    //
    // final camera = CameraComponent(world: world)
    //   ..viewfinder.visibleGameSize =
    //   Vector2(squareWidth * 7 + squareGap * 8, 4 * squareHeight + 3 * squareGap)
    //   ..viewfinder.position = Vector2(squareWidth * 3.5 + squareGap * 4, 0)
    //   ..viewfinder.anchor = Anchor.topCenter;
    // add(camera);

  }


}