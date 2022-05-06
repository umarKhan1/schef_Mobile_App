
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:schef/Introslider/slide.dart';
import '../constant.dart';


class SlideItem extends StatelessWidget {
  final int index;
  final double height;
  SlideItem(this.index,this.height);

  @override
  Widget build(BuildContext context) {


    return Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height:  height < 670 ? 20: 40,
        ),
        Container(
          width:  MediaQuery.of(context).size.width * 0.6,
          height: 300,
          decoration: BoxDecoration(
//            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage(slideList[index].imageUrl!),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(
          height:  height < 670 ? 10.0 : 40,
        ),
        AutoSizeText(
          slideList[index].title!,
          textScaleFactor:  height < 670 ? 1.1: 1.2,
          style: const TextStyle(
              fontSize: 18, color: Constants.APP_WHITE_COLOR, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          minFontSize: 12,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: height < 670 ? 10 : 20,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: AutoSizeText(
            slideList[index].description!,
            textScaleFactor:  height < 670  ? 1.2: 1.0,
            style: const TextStyle(
              // fontSize: 14,
                color: Constants.APP_TEXT_GREY_COLOR,
                fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
            minFontSize: 11,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
//        Text(
//
//          textAlign: TextAlign.center,
//          style: TextStyle(fontSize: 16),
//        ),


      ],
    );
  }
}