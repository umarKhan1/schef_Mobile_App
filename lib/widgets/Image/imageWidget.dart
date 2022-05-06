import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  ImageWidget(this.imagePath,{required this.width,required this.height});
  @override
  Widget build(BuildContext context) {
    return Image(image: AssetImage(imagePath),width: width,height: height,);
  }
}
