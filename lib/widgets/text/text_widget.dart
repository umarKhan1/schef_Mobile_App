
import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {

  TextWidget(this.text, this.isUnderline ,{required this.fontWeight , required this.textScale,required this.textColor,this.textAlign = TextAlign.center});

  final bool isUnderline;
  final String text;
  final FontWeight fontWeight;
  final double textScale;
  final Color textColor;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      textScaleFactor: textScale,
      textAlign: textAlign,

      style: TextStyle(
        decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
      fontWeight: fontWeight,
        color: textColor,
height: 1.5


    ),);
  }
}
