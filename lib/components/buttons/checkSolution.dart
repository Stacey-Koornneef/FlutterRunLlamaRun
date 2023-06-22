import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:testing/components/buttons/tryAgainButton.dart';
import 'package:testing/llama.dart';
import 'package:collection/collection.dart';
import 'continueButton.dart';

/*
This class is used to check if the users solution is correct or not
 */
class CheckSolution {

  bool correct = false;

  /*
  Checks to see if the solution is correct or not, then sends to the appropriate
  function
   */
  CheckSolution(List instructions, List solution){
    print("instructions: " + instructions.toString());
    print("solution: " + solution.toString());
    //creates the equality function from the collection package
    Function equality = const DeepCollectionEquality().equals;
    print(equality(instructions, solution));


    if(equality(instructions, solution)){
      isCorrect();
      correct = true;
    }else{
      isIncorrect();
      correct = false;
    }

  }

  /*
  if the solution is correct, make the continue button
   */
  isCorrect(){
    print("CORRECT");

    //canPickUpApple = true;
    ContinueButton();

  }

  /*
  if the solution is wrong, make the try again button
   */
  isIncorrect(){
    print("INCORRECT");

    TryAgainButton();

  }




}