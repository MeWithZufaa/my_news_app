
import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
   ReusableText({Key? key, required this.text,this.color=Colors.black,this.size=16.0,this.fontWeight}) : super(key: key);

  final String text;
  Color color;
  double size;
  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: size,color: color,fontWeight: fontWeight,),);
  }
}
