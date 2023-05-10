import 'dart:ffi';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:testing/components/pieces/apple.dart';
import 'package:flutter/services.dart';

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
//determines if the apple needs to be removed
bool removeApple = false;
//determines if the apple is still on the board
bool appleAvailable = false;
//for checking if the solution is correct and the apple can be picked up
bool canPickUpApple = false;

//gets information about the continue button
var getContinueButton = ContinueButton();
var continueButton = getContinueButton.continueButton;
//gets information about the try again button
var getTryAgainButton = TryAgainButton();
var tryAgainButton = getTryAgainButton.tryAgainButton;

//the variables for various sizes with default values
var squareSide;
var squareGap = 3.0;
var squareRadius = 3.0;
var squareSize;
double widthOfLeft = 0;
double widthOfRight = 0;
var runButtonPosition;


//gets information about the level
var levelOverall = Level(level);
var levelBlocks = levelOverall.blocks;
var levelSolution = levelOverall.solution;
var character = levelOverall.character;
var apple = levelOverall.apple;

//gets information about device size
var height;
var width;



//a list of all of the visible components in the app
List<Component> components = [];
//current level
int level = 1;



/*
LlamaGame class is all the visible items and update information for the whole app
 */
class LlamaGame extends FlameGame with HasTappables {
  //setting up board
  /*static const double squareWidth = 80;
  static const double squareHeight = 80;
  static const double squareGap = 3;
  static const double squareRadius = 3.0;
  static final Vector2 squareSize = Vector2(squareWidth, squareHeight);*/
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
      //print("startload "+ startLoad.toString());
    }


    //creates and removes the llama loading character
    if(startLoad == true){
      //print("startload = true");
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
      canPickUpApple = false;
      for(var i in components){
        remove(i);
        print(i);
      }
      //removeApple=true;
      //remove(apple);

      if(appleAvailable == true){
        remove(apple);
        appleAvailable = false;
        print("removing apple");
      }


      //gets new level information, in case the level changed
      levelOverall = Level(level);
      levelBlocks = levelOverall.blocks;
      levelSolution = levelOverall.solution;
      character = levelOverall.character;
      apple = levelOverall.apple;

      //add all of the new level information
      components = [];
      for(var element in levelBlocks){
        add(element);
        components.add(element);
      }
      add(character);
      components.add(character);
      add(apple);
      appleAvailable = true;
      //components.add(apple);

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

    if(removeApple == true){
      //removeAll(apple);
      //remove(apple);
      /*print("THIS IS THE APPLE IN REMOVEAPPLE");
      print(apple);
      remove(apple);
      removeApple = false;
      appleAvailable = false;
      print("removing apple");*/

      if(appleAvailable == true){
        print("THIS IS THE APPLE IN REMOVEAPPLE");
        print(apple);
        remove(apple);
        removeApple = false;
        appleAvailable = false;
        print("removing apple");
      }else{
        removeApple = false;
        appleAvailable = false;
      }

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

    //Find the width and height of the screen
    var newSize = this.size;
    print("SIZE: " + newSize.toString());
    if(newSize[0] > newSize[1]){
      width = newSize[0];
      height = newSize[1];
    }else{
      width = newSize[1];
      height = newSize[0];
    }
    print("WIDTH = " + width.toString());
    print("HEIGHT + " + height.toString());

    setSizes();


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
    //components.add(apple);
    add(apple);
    add(runBlocksButton!);
    addAll(components);
    appleAvailable=true;

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
        reset = true;
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
      position: runButtonPosition,
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

  /*
  set the sizes of blocks based on the size of the device
   */
  void setSizes(){

    widthOfLeft = width * 0.35;
    widthOfRight = width * 0.65;
    print("Width of Left = " + widthOfLeft.toString());
    print("Width of Right = " + widthOfRight.toString());
    var x = widthOfRight * 0.125;
    var y = x*5;
    if(y >= height){
      squareSide = height * 0.125;
    }else{
      squareSide = x;
    }
    print("squareSide = " + squareSide.toString());
    squareSize = Vector2(squareSide, squareSide);

    //var runButtonX = widthOfLeft = ((2*squareSide + (4* squareGap)));
    var runButtonX = widthOfLeft + (squareSide * 2.5) + ((squareGap +  squareRadius) * 3.5);
    var runButtonY = ((squareSide * 5) + ((squareGap +  squareRadius) * 7));
    runButtonPosition = Vector2(runButtonX,runButtonY);
    print("RUN BUTTON POS: " + runButtonPosition.toString());

    //reset = true;


  }

}
