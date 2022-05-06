import 'package:flutter/material.dart';

import '../constant.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 8 : 8,
      width: isActive ? 30 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Constants.APP_TEXT_GREY_COLOR,
        borderRadius: BorderRadius.all(const Radius.circular(10)),
      ),
    );
  }
}