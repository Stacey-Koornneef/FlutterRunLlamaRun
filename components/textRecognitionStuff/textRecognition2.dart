import 'dart:io';

import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:testing/llama.dart';
import 'package:flutter/material.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:image_picker/image_picker.dart';

class TextRecognition2 extends ChangeNotifier{

var instructions = [];
var blocks = [];

/*
This does everything relating to the text recognition.  I'm not 100% sure how it
works, but it does.  It's best not to touch it
 */
  TextRecognition2(){
    print("in text recognition2");

  }

  Future setup() async{
    runTextRecognition().then((value) => null);
  }

  Future runTextRecognition() async{
    print("in run text recognition");
    XFile? photo = await GetImage();
    print("type of get image");
    print(photo.runtimeType);
  }

  Future<XFile?> GetImage() async {
    print(" in getImage");
    instructions = [];
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    //return photo;
    changeFile(photo!).then((value) => null);
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
    var result2 = await _textRecognition.process(inputImage);
    Future.delayed(Duration(milliseconds: 3000), () {
      print("delayed");
      data.add(result2?.text);
      print(data);
      CleanData(data).then((value) => null);
    });
  }

  List<dynamic> get instruction => instructions;


  Future CleanData(List data) async{
    print("In CLEAN DATA");
    var newData = [];
    for(var x in data){
      newData = (x.split('\n'));
    }
    print("newData = " + newData.toString());
    var position = 125.0;
    for(var i in newData){
      print("i = " + i.toString());
      print("i type = " + i.runtimeType.toString());
      if(i == "FORWARD" || i == "LEFT" || i == "RIGHT" || i == "PICKUP" || i == "PICK UP"){
        if(i == "PICK UP"){
          i = "PICKUP";
        }
        instructions.add(i);
        position = position + 75.0;
        print("in loop");
      }
    }
    timeToUpdate = true;
    print(instructions);
  }
}




