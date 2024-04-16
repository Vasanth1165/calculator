
import 'package:calculator/app/controllers/expression_controller.dart';
import 'package:calculator/app/controllers/keys_controller.dart';
import 'package:calculator/app/utils/mybutton.dart';
import 'package:calculator/app/views/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {

  final keysController =Get.put(KeysController());
  final expressionController =Get.put(ExpressionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: const Icon(Icons.zoom_in_map_sharp),
        actions: [
          GestureDetector(
            onTap: (){
              Get.to(()=>const MySettingsPage());
            },
            child: const Icon(Icons.settings_outlined)),
          const SizedBox(
            width: 12,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            child: TextField(
              controller: keysController.textEditingController,
              style: const TextStyle(color: Colors.white,fontSize: 72),
              textAlign: TextAlign.right,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "0",
                hintStyle:TextStyle(color: Colors.grey)
              ),
              keyboardType: TextInputType.none,
              onChanged: (val){
                print(val);
                expressionController.validateExpressionAnswer(keysController.textEditingController.text);
              },
            ),),
          Align(
            alignment: Alignment.centerRight,
            child: Obx(() => Text(expressionController.expressionAnswer.value,style: const TextStyle(fontSize: 48,color: Colors.grey),))),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Spacer(),
              MyButton(name: "AC", onTap: (){
                keysController.onAllClear();
              }),
              const Spacer(),
              MyButton(name: "C", onTap: (){
                keysController.onClear();
              }),
              const Spacer(),
              MyButton(name: "%", onTap: (){
                keysController.onTabSymbol("%");
              }),
              const Spacer(),
              MyButton(name: "/", onTap: (){
                keysController.onTabSymbol("/");
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Spacer(),
              MyButton(name: "7", onTap: (){
                keysController.onTapNumber("7");
              }),
              const Spacer(),
              MyButton(name: "8", onTap: (){
                keysController.onTapNumber("8");
              }),
              const Spacer(),
              MyButton(name: "9", onTap: (){
                keysController.onTapNumber("9");
              }),
              const Spacer(),
              MyButton(name: "X", onTap: (){
                keysController.onTabSymbol("*");
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Spacer(),
              MyButton(name: "4", onTap: (){
                keysController.onTapNumber("4");
              }),
              const Spacer(),
              MyButton(name: "5", onTap: (){
                keysController.onTapNumber("5");
              }),
              const Spacer(),
              MyButton(name: "6", onTap: (){
                keysController.onTapNumber("6");
              }),
              const Spacer(),
              MyButton(name: "-", onTap: (){
                 keysController.onTabSymbol("-");
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const Spacer(),
              MyButton(name: "1", onTap: (){
                keysController.onTapNumber("1");
              }),
              const Spacer(),
              MyButton(name: "2", onTap: (){
                keysController.onTapNumber("2");
              }),
              const Spacer(),
              MyButton(name: "3", onTap: (){
                keysController.onTapNumber("3");
              }),
              const Spacer(),
              MyButton(name: "+", onTap: (){
                 keysController.onTabSymbol("+");
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(width: 3,),
              Expanded(flex: 2,child: MyButton(name: "0", onTap: (){
                keysController.onTapNumber("0");
              })),
              const SizedBox(width: 3,),
              MyButton(name: ".", onTap: (){
                 keysController.onTabSymbol(".");
              }),
              const SizedBox(width: 3,),
              MyButton(name: "=", onTap: (){
                expressionController.validateExpressionAnswer(keysController.textFieldExpression.toString());
              }),
            ],
          ),
          const SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}