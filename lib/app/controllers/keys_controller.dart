import 'package:calculator/app/controllers/expression_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeysController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  final expressionController=Get.put(ExpressionController());

  RxString textFieldExpression= "".obs;
  TextEditingController textEditingController=TextEditingController();
  onChangeExpressionValue(String exp){
    textFieldExpression.value=exp;
    textEditingController.text=textFieldExpression.value;
  }

  onTapNumber(String number){
    textFieldExpression.value+=number;
    textEditingController.text=textFieldExpression.value;
    print(textFieldExpression);
  }

  onTabSymbol(String symbol){
    textFieldExpression.value+=symbol;
    textEditingController.text=textFieldExpression.value;
    print(textFieldExpression);
  }

  onClear(){
    textFieldExpression.value=textFieldExpression.substring(0,textFieldExpression.value.length-1);
    textEditingController.text=textFieldExpression.value;
  }

  onAllClear(){
    textFieldExpression.value="";
    textEditingController.text=textFieldExpression.value;
    expressionController.clearAnswer();
  }
}