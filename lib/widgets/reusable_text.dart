
import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
   ReusableText({Key? key, required this.text,this.color=Colors.black,this.size=16.0,this.fontWeight,this.maxLines}) : super(key: key);

  final String text;
  Color color;
  double size;
  FontWeight? fontWeight;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(text,maxLines: maxLines, style: TextStyle(fontSize: size,color: color,fontWeight: fontWeight,),);
  }
}
