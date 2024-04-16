import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String name;
  final VoidCallback onTap;
  const MyButton({super.key, required this.name, required this.onTap});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  bool _isTapped=false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapUp: (val){
        setState(() {
          _isTapped=false;
        });
      },
      onTapDown: (val){
        setState(() {
          _isTapped=true;
        });
      },
      child: Transform.translate(
        offset: Offset(_isTapped ? 2:0,_isTapped ? 2 : 0),
        child: AnimatedContainer(
          height: 100,
          width: 100,
          duration: const Duration(
            milliseconds: 100,
          ),
          decoration: BoxDecoration(
            color: Colors.orange,
            boxShadow: [
               BoxShadow(
                color: Colors.white,
                offset: Offset(_isTapped ? 0 :2, _isTapped ? 0 :2),
               )
            ]
          ),
          child: Center(child: Text(widget.name,style: const TextStyle(color: Colors.white,fontSize: 38),),),
        ),
      ),
    );
  }
}