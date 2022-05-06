import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schef/AuthPage/loginpage.dart';
import 'package:schef/Introslider/introscreen.dart';
import 'package:schef/Introslider/introslider.dart';
import 'package:video_player/video_player.dart';


class SplashPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  VideoPlayerController? controller;
  bool visible = false;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    controller = VideoPlayerController.asset("assets/Videos/splash.mp4");
    controller!.initialize().then((_) {
      controller!.setLooping(true);
      Timer(const Duration(milliseconds: 100), () {
        setState(() {
          controller!.play();
          visible = true;
        });
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const IntroScreen()),
              (e) => false);
    });
  }
  getBackgroundColor() {
    return Container(color: Colors.transparent //.withAlpha(120),
    );
  }

  getContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller!.dispose();
      controller = null;
    }
  }

  getVideoBackground() {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 1000),
      child: VideoPlayer(controller!),
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(height: 500, width:600 , child:    getVideoBackground(),),
      ),
    );
  }
}

