import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
//import 'package:testing/components/loadCharacter.dart';

import 'components/pieces/character.dart';
import 'components/levels/levelOne.dart';
import 'components/levels/levelTwo.dart';
import 'components/buttons/spriteTextButton.dart';
import 'components/buttons/getBlocks.dart';
import 'components/buttons/runBlocksButton.dart';
import 'components/textRecognitionStuff/textRecognition2.dart';
import 'components/pieces/loadCharacter.dart';
import 'components/levels/level.dart';
import 'dart:async';

bool timeToUpdate = false;
int level = 1;
/*var levelOne = LevelOne();
var levelOneBlocks = levelOne.blocks;

var levelTwo = LevelTwo();
var levelTwoBlocks = levelTwo.blocks;*/
bool reset = false;

var levelOverall = Level(level);
var levelBlocks = levelOverall.blocks;

List<Component> components = [];

class LlamaGame extends FlameGame with HasTappables {
  //setting up board
  static const double squareWidth = 80;
  static const double squareHeight = 80;
  static const double squareGap = 3;
  static const double squareRadius = 3.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);
  SpriteTextButton? getBlocksButton;
  SpriteTextButton? runBlocksButton;

  //for checking when the buttons have run
  bool getBlocksRun = false;
  bool runBlocksRunning = false;

  var newInstructions = [];
  var oldInstructions = [];//?

  bool startLoad = false;

  var loadCharacter;
  bool loading = false;
  var character;

  var imagesToLoad = <String>[
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
  ];



  @override
  void update(double dt){
    super.update(dt);

    //checks to see if the blocks from the picture has loaded to update loading
    if((timeToUpdate == true) && (response.instructions.length != 0)){
      var getBlocks = GetBlocks(response.instructions);
      var newBlocks = getBlocks.blocks;
      for(var i in newBlocks){
        add(i);
        components.add(i);
      }
      timeToUpdate = false;
      startLoad = false;
      print("startload "+ startLoad.toString());
    }

    if(startLoad == true){
      print("startload = true");
      loading = true;
    }else if(startLoad == false){
      if(loading == true){
        remove(loadCharacter);
        loading = false;
      }
    }

    if(reset == true){
      print("reset");
      print(components);
      for(var i in components){
        remove(i);
      }
      remove(character);

      for(var element in levelBlocks){
        add(element);
        components.add(element);
      }

      reset = false;
    }


  }



  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  var response = TextRecognition2();

  @override
  Future<void> onLoad() async {
    Flame.device.setLandscape();
    await Flame.images.loadAll(imagesToLoad);

    createGetBlocksButton();
    add(getBlocksButton!);

    //var levelInst = Level(level);

    //creates an initial instance of character, but position is changed in level
    character = Character()
      ..size = (squareSize * 1.75)
      ..position = Vector2(squareGap + (4.65+2) * (squareWidth + squareGap),
        (squareHeight*3.7) + 3 * squareGap,);

    createRunBlocksButton();

    for(var element in levelBlocks){
      //add(element);
      components.add(element);
    }

    add(runBlocksButton!);
    addAll(components);

    /*if(level==1){
      for(var element in levelOneBlocks){
        add(element);
        components.add(element);
      }
    }*/



  }


  Future getInstructions() async{
    print("in getInstructions");
    response.setup().then((value) {
      print("response after text recognition: " + response.toString());
      var getBlocks = GetBlocks(response.instructions);
      print("getBlocks = " + getBlocks.toString());
      var getBlocksList = getBlocks.blocks;

      return (getBlocksList);

    } );

  }

  void createGetBlocksButton(){
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

        });

      },
      text: "Get Blocks",
      textXShift: 400,
      textYShift: 100,
    );
  }

  void createRunBlocksButton(){
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
            components.add(element);
          }
        }
      },
      text: "Run, Llama, Run",
      textXShift: -430,
      textYShift: -250,
    );
  }

}
