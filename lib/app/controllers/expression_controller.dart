import 'package:get/get.dart';
import 'package:function_tree/function_tree.dart';

class ExpressionController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  RxString expressionAnswer="0".obs;
  validateExpressionAnswer(String expressionValue){
    expressionAnswer.value=expressionValue.interpret().toString();
  }

  clearAnswer(){
    expressionAnswer.value="0";
  }
}