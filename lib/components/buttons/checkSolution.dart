import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:testing/components/buttons/tryAgainButton.dart';
import 'package:testing/llama.dart';
import 'package:collection/collection.dart';
import 'continueButton.dart';

class CheckSolution {


  CheckSolution(List instructions, List solution){
    print("instructions: " + instructions.toString());
    print("solution: " + solution.toString());
    Function equality = const DeepCollectionEquality().equals;
    print(equality(instructions, solution));

    if(equality(instructions, solution)){
      isCorrect();
    }else{
      isIncorrect();
    }

  }

  isCorrect(){
    print("CORRECT");

    ContinueButton();

  }

  isIncorrect(){
    print("INCORRECT");

    TryAgainButton();

  }




}