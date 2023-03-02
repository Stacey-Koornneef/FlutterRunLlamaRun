import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/buttons/spriteTextButton.dart';
import 'components/buttons/getBlocks.dart';
import 'components/buttons/runBlocksButton.dart';
import 'components/textRecognitionStuff/textRecognition2.dart';
import 'components/pieces/loadCharacter.dart';
import 'components/levels/level.dart';
import 'components/buttons/continueButton.dart';
import 'components/buttons/tryAgainButton.dart';
import 'dart:async';

//determines if the movement blocks need to be updated on the main screen
bool timeToUpdate = false;
//determines if the whole app needs to be reset (this counts for level changes)
bool reset = false;
//determines if the continue button needs to be added to the screen
bool addContinueButton = false;
//determines if the try again button needs to be added
bool addTryAgainButton = false;

//gets information about the continue button
var getContinueButton = ContinueButton();
var continueButton = getContinueButton.continueButton;
//gets information about the try again button
var getTryAgainButton = TryAgainButton();
var tryAgainButton = getTryAgainButton.tryAgainButton;


//gets information about the level
var levelOverall = Level(level);
var levelBlocks = levelOverall.blocks;
var levelSolution = levelOverall.solution;
var character = levelOverall.character;
var apple = levelOverall.apple;

//a list of all of the visible components in the app
List<Component> components = [];
//current level
int level = 1;

/*
LlamaGame class is all the visible items and update information for the whol app
 */
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
  bool blocksAvailable = false;
  bool runBlocksRunning = false;

  //the new instructions from getInstructions (text recognition stuff
  var newInstructions = [];

  //all variables associated with the loading character
  bool startLoad = false;
  var loadCharacter;
  bool loading = false;

  //all of the images that nee to be loaded
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



  /*
  The update function is for anything that needs to be updated at any point in
  the program, usually used for adding new components.  Automatically runs on a
  regular basis (>1 times per second)
   */
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


    //creates and removes the llama loading character
    if(startLoad == true){
      print("startload = true");
      loading = true;
    }else if(startLoad == false){
      if(loading == true){
        remove(loadCharacter);
        loading = false;
      }
    }

    //everything related to resetting the screen
    if(reset == true){
      print("reset");
      print(components);
      for(var i in components){
        remove(i);
      }
      //remove(character);

      //gets new level information, in case the level changed
      levelOverall = Level(level);
      levelBlocks = levelOverall.blocks;
      levelSolution = levelOverall.solution;
      character = levelOverall.character;
      apple = levelOverall.apple;

      //add all of the new level information
      for(var element in levelBlocks){
        add(element);
        components.add(element);
      }
      add(character);
      components.add(character);
      add(apple);
      components.add(apple);

      reset = false;
    }

    //adds the continue button to the screen
    if(addContinueButton == true){
      add(continueButton);
      components.add(continueButton);
      addContinueButton = false;
    }

    //adds the try again button to the screen
    if(addTryAgainButton == true){
      add(tryAgainButton);
      components.add(tryAgainButton);
      addTryAgainButton = false;
    }


  }


  //changes the background colour to white
  @override
  Color backgroundColor() => const Color(0xFFFFFFFF);

  //creates an instance of TextRecognition2
  var response = TextRecognition2();

  /*
  The onLoad function handles everything that needs to be done at the initial
  start up, such as loading all necessary buttons and loading the first level
   */
  @override
  Future<void> onLoad() async {
    Flame.device.setLandscape();
    await Flame.images.loadAll(imagesToLoad);

    //makes the get blocks button
    createGetBlocksButton();
    add(getBlocksButton!);

    //makes the run blocks button
    createRunBlocksButton();

    //adds all of the blocks in level one
    for(var element in levelBlocks){
      //add(element);
      components.add(element);
    }

    components.add(character);
    components.add(apple);
    add(runBlocksButton!);
    addAll(components);

  }


  /*
  getInstructions is used to get the text recognition instructions
   */
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

  /*
  creates the get blocks button and calls the instructions when it gets clicked
   */
  void createGetBlocksButton(){
    getBlocksButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 5,
      scale: Vector2(0.1,0.1),
      position: Vector2(50,30),
      onPressed: () async{
        //creates a load character while waiting for the instructions
        loadCharacter = LoadCharacter()
          ..size = (squareSize *1.75)
          ..position = Vector2(100,100);

        add(loadCharacter);
        startLoad = true;

        blocksAvailable = true;
        print("Get Blocks");

        //calls getInstructions to retrieve the instructions from photo
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

  /*
  creates the Run Blocks button and what it needs to do when clicked
   */
  void createRunBlocksButton(){
    runBlocksButton = SpriteTextButton(
      button: Sprite(Flame.images.fromCache('buttonBackground1.png')),
      priority: 6,
      scale: Vector2(0.1,0.1),
      position: Vector2(495, 425),
      onPressed: () {
        print("Run Blocks");
        //if the blocks are available, then makes the character move and adds the new blocks
        if(blocksAvailable == true){
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
