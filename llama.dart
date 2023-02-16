//import 'dart:html';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:testing/components/loadCharacter.dart';
//import 'package:provider/provider.dart';

import 'components/character.dart';
import 'components/loadCharacter.dart';
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
import 'package:async/async.dart';
import 'dart:async';
import 'package:flame/timer.dart';

bool timeToUpdate = false;
int level = 1;
var levelOne = LevelOne();
var levelOneBlocks = levelOne.blocks;

var levelTwo = LevelTwo();
var levelTwoBlocks = levelTwo.blocks;
bool reset = false;

List<Component> components = [];

class LlamaGame extends FlameGame with HasTappables {
  //setting up board
  static const double squareWidth = 80;
  static const double squareHeight = 80;
  static const double squareGap = 3;
  static const double squareRadius = 3.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);
  //int level = 1;
  SpriteTextButton? getBlocksButton;
  SpriteTextButton? runBlocksButton;

  //List<Component> components = [];
  //final world = World();
  //for checking when the buttons have run
  bool getBlocksRun = false;
  bool runBlocksRunning = false;

  var newInstructions = [];
  var oldInstructions = [];//?

  bool startLoad = false;

  var loadCharacter;
  bool loading = false;



  @override
  void update(double dt){
    //print("in update");
    super.update(dt);

    //print("timeToUpdate" + timeToUpdate.toString());
    //print("response " + response.instructions.length.toString());
    if((timeToUpdate == true) && (response.instructions.length != 0)){//change to 0?

      print("in update if");
      //print("len " + response.instructions.length.toString());
      //print("newIn len = " + newInstructions.length.toString());
      //print("oldIn len = " + oldInstructions.length.toString());
      var getBlocks = GetBlocks(response.instructions);
      var newBlocks = getBlocks.blocks;
      //components.add(newBlocks);
      //print("newBlocks = " + newBlocks.toString());
      for(var i in newBlocks){
        add(i);
        components.add(i);
        print("in add for loop in llama");
      }
      //remove(loadCharacter);
      timeToUpdate = false;
      startLoad = false;
      print("startload "+ startLoad.toString());

      //oldInstructions = newInstructions;
      //print(("oldInstructions = " + oldInstructions.toString()));
    }

    /*if(startLoad == false){
      //print("in start if");
      //print(loadCharacter);
      //remove(loadCharacter);
    }*/



    if(startLoad == true){
      print("startload = true");
      //add(loadCharacter);
      loading = true;
      if(loading == true){
      }
    }else if(startLoad == false){
      if(loading == true){
        remove(loadCharacter);
        loading = false;
      }else{
      }

    }

    if(reset == true){
      print("reset");
      print(components);
      removeAll(components);
      reset = false;
    }


  }



  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  var response = TextRecognition2();

  @override
  Future<void> onLoad() async {
    //await Flame.device.fullScreen();
    //await Flame.device.setOrientation(DeviceOrientation.landscapeRight);
    Flame.device.setLandscape();
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
      'pickUpBlock.png',
      'llama_eat_1.png',
      'llama_eat_2.png',
      'llama_eat_3.png',
      'llama_eat_4.png'
    ]);

    loadCharacter = LoadCharacter()
      ..size = (squareSize *1.75)
      ..position = Vector2(100,100);

    getBlocksButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 5,
      scale: Vector2(0.1,0.1),
      position: Vector2(50,30),
      onPressed: () async{
         loadCharacter = LoadCharacter()
          ..size = (squareSize *1.75)
          ..position = Vector2(100,100);

        add(loadCharacter);
        startLoad = true;

        getBlocksRun = true;
        print("Get Blocks");




        getInstructions().then((value) {
          print("in await");
          print("value type: " + value.runtimeType.toString());
          print("value " + value.toString());
          for(var element in value){
            newInstructions.add(element);
            print("element" + element.toString());
          }
          // maybe setState()

        });

        //remove(loadCharacter);

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

    /*final loadCharacter = LoadCharacter()
      ..size = (squareSize *1.75)
      ..position = Vector2(100,100);*/


    //add(character);

    runBlocksButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 6,
      scale: Vector2(0.1,0.1),
      position: Vector2(495, 425),
      onPressed: () {
        print("Run Blocks");
        if(getBlocksRun == true){//rename bool blocksAvailable
          var getComponents = RunBlocksButton(character, response.instructions);
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



    /*var levelOne = LevelOne();
    var levelOneBlocks = levelOne.blocks;

    var levelTwo = LevelTwo();
    var levelTwoBlocks = levelTwo.blocks;*/


    // final world = World()
    //..add(blocks)
    // ..add(character)
    add(character);
    //add(loadCharacter);
    addAll(components);
    //add(runBlocksButton!);
    // //..add(apple)
    // ..addAll(components)
    // //..add(getBlocksButton!)
    // ..add(runBlocksButton!);
    //..addAll(levelOneBlocks);
    //print(levelOneBlocks);
    /*for(var element in levelOneBlocks){
      // world.add(element);
      add(element);
    }*/
    /*for(var element in levelTwoBlocks) {
      // world.add(element);
      add(element);
    }*/

    if(level==1){
      for(var element in levelOneBlocks){
        add(element);
      }
    }else if(level == 2){
      for(var element in levelTwoBlocks){
        add(element);
      }
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
  Future getInstructions() async{
    print("in getInstructions");
    //var response = TextRecognition2();
    response.setup().then((value) {
      print("response after text recognition: " + response.toString());
      /*print(response);
      var result = response.instructions;
      print("INSTRUCTIONS: " + result.toString());
      //instructions = ["FORWARD"];
      for(var i in result){
        newInstructions.add(i);
      }
      print("llama instructions = " + newInstructions.toString());*/
      var getBlocks = GetBlocks(response.instructions);
      print("getBlocks = " + getBlocks.toString());
      var getBlocksList = getBlocks.blocks;
      //var getBlocksList = response.blocks;
      /*Future.delayed(Duration(milliseconds: 3000), () {
        print("delayed");
      });*/
      /*print("before add loop in llama");
      for(var i in getBlocksList){
        add(i);
        print("in add for loop in llama");
      }*/

      return (getBlocksList);


    } );

    /*await TextRecognition2().then(response) {
      print("response after text recognition: " + response.toString());
      print(response);
      var result = response.instructions;
      print("INSTRUCTIONS: " + result.toString());
      };*/

  }





}