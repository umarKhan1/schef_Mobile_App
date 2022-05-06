
import 'package:flutter/material.dart';

class OnTapContainer extends StatelessWidget {

   const OnTapContainer(this.isImage,this.isIcon,this.text, this.height,this.width,{required this.fontWeight , required this.textScale,required this.textColor,this.borderRadius = 0.0, required this.containerColor, this.imagePath = "", this.imageheight = 0, this.imageWidth = 0});

  final bool isImage;
  final bool isIcon;
  final double height;
  final double width;
  final double imageWidth;
  final double imageheight;
  final FontWeight fontWeight;
  final double textScale;
  final Color textColor;
  final Color containerColor;
  final String text;
  final double borderRadius ;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 8,
            )
          ]
      ),
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         isImage ?  Image(image: AssetImage(imagePath),width: imageWidth,height: imageheight,): Container(),
          isImage ? const SizedBox(height: 10,) :const SizedBox(height: 0,),
          Row(
            mainAxisAlignment: isIcon ? MainAxisAlignment.center :MainAxisAlignment.center,
            children: [
              isIcon ?Image(image: AssetImage(imagePath),width: 25,height: 25,): Container(),
              Text(text,
                textScaleFactor: textScale,
                style: TextStyle(
                color: textColor,
                fontWeight: fontWeight,
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
