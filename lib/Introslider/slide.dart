import 'package:flutter/material.dart';

//import 'package:auto_size_text/auto_size_text.dart';
class Slide {
  final String? description;
  final String? imageUrl;
  final String? title;

  Slide({
    @required this.description,
    @required this.imageUrl,
    @required this.title,
  });
}

final slideList = [
  Slide(
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus auctor dolor et consequat sagittis. Suspendisse potenti.',
    imageUrl: 'assets/mainlogo.png',
    title: 'Lorem ipsum',
  ),
  Slide(
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus auctor dolor et consequat sagittis. Suspendisse potenti.',
    imageUrl: 'assets/mainlogo.png',
    title: 'Lorem ipsum',
  ),
  Slide(
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus auctor dolor et consequat sagittis. Suspendisse potenti.',
    imageUrl: 'assets/mainlogo.png',
    title: 'Lorem ipsum',
  ),
];