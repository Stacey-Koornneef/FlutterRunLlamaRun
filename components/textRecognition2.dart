import 'dart:io';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:testing/components/getBlocks.dart';
import 'movementBlocks.dart';
import 'character.dart';
import 'package:flame/timer.dart';
import 'spriteTextButton.dart';
import 'package:flutter/material.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
//import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:simple_ocr_plugin/simple_ocr_plugin.dart';




class TextRecognition2 extends ChangeNotifier{

var instructions = [];
var blocks = [];

  TextRecognition2(){
    print("in text recognition2");
    //print(instructions);

  }

  Future setup() async{
    runTextRecognition().then((value) => null);
  }

  Future runTextRecognition() async{
    XFile? photo = await GetImage();
    print("type of get image");
    print(photo.runtimeType);
  }

  Future<XFile?> GetImage() async {
    print("getImage");
    final ImagePicker _picker = ImagePicker();
    print('debug1');
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    print('debug2');
    //return photo;
    changeFile(photo!).then((value) => null);
    print('debug3');
  }

  Future changeFile(XFile image) async{
    print("in changefile");
    File? file = File(image!.path);
    print(file.runtimeType);
    //return file;
    getData(file).then((value) => null);
  }

  Future getData(File file) async{
    print("in getdata");
    var data = [];
    TextRecognition _textRecognition = TextRecognition();
    final inputImage = InputImage.fromFile(file);
    //String result = await SimpleOcrPlugin.performOCR(file.path);
    var result2 = await _textRecognition.process(inputImage);
    Future.delayed(Duration(milliseconds: 3000), () {
      print("delayed");
      data.add(result2?.text);
      print(data);
      CleanData(data).then((value) => null);
    });
    //_startRecognition(inputImage);
    //print("RESULT:" + result.toString());
    //print(result);
    //instructions.add(result2?.text);
    /*data.add(result2?.text);
    print(data);
    CleanData(data).then((value) => null);*/
    //print("Instructions " + instructions.toString());
    //print(result2?.text);
    //print(result.runtimeType);
  }

  List<dynamic> get instruction => instructions;

  set instruction(data){
    instructions = data;
    notifyListeners();
  }

  addInstructions(newInstruction){
    instructions.add(newInstruction);
    notifyListeners();
  }


  /*Future<void> _startRecognition(InputImage image) async {
    TextRecognition _textRecognition = TextRecognition();
    var result = await _textRecognition.process(image);
    print("In start recognition");
    print(result);

    TextRecognitionState state = Provider.of(context, listen: false);

    if (state.isNotProcessing) {
      state.startProcessing();
      state.image = image;
      state.data = await _textRecognition?.process(image);
      state.stopProcessing();
    }
  }*/

  /*@override
  Widget build(BuildContext context) {
    return InputCameraView(
      mode: InputCameraMode.gallery,
      // resolutionPreset: ResolutionPreset.high,
      title: 'Text Recognition',
      onImage: _startRecognition,
      overlay: Consumer<TextRecognitionState>(
        builder: (_, state, __) {
          if (state.isNotEmpty) {
            return Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Text(
                  state.text,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }*/

  Future CleanData(List data) async{
    print("In CLEAN DATA");
    var newData = [];
    for(var x in data){
      newData = (x.split('\n'));
    }
    print("newData = " + newData.toString());
    //List<String> newData = data.split('/n');
    var position = 125.0;
    for(var i in newData){
      print("i = " + i.toString());
      print("i type = " + i.runtimeType.toString());
      if(i == "FORWARD" || i == "LEFT" || i == "RIGHT" || i == "PICKUP" || i == "PICK UP"){
        instructions.add(i);
        //var block = GetBlocks(i, position);
        //blocks.add(block);
        position = position + 75.0;
        print("in loop");
      }
    }
   // return(instructions);
    print(instructions);
  }
}




