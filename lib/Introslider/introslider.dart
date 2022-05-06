import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:schef/AuthPage/loginpage.dart';
import 'package:schef/Introslider/slide.dart';
import 'package:schef/Introslider/slidedot.dart';
import 'package:schef/Introslider/slideitme.dart';
import '../constant.dart';


//import '../../Screens/login_screen.dart';
class GettingStartedScreen extends StatefulWidget {
  const GettingStartedScreen({Key? key}) : super(key: key);

  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }
  double right = 0 ;
  bool isYes1 = false;
  bool isYes2 = false;
  bool isYes3 = false;
  bool isYes4 = false;
  bool isYes5 = false;


  isYesOne() async{
    setState(() {
      isYes1 = !isYes1;
    });
    isYes1 ? print("Yes 1") : print("No 1");
    // isYes1 ?
    // await Future.delayed(Duration(milliseconds: 1100)).then((value) => Get.to(LoginScreen()))
    //     :await Future.delayed(Duration(milliseconds: 1100)).then((value) => Get.to(SignUpScreen()));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Constants.APP_BACKGROUND_COLOR,

        body: Stack(
          children: <Widget>[

            Container(
              color: Constants.APP_BACKGROUND_COLOR,
              child: Column(
                children: <Widget>[
                  SizedBox(

                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,

                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 40.0,
                          ),
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: <Widget>[
                                PageView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: _pageController,
                                  onPageChanged: _onPageChanged,
                                  itemCount: slideList.length,
                                  itemBuilder: (ctx, i) => SlideItem(i,90),
                                ),
                                Container(
                                  height: 8.0,
                                  margin: const EdgeInsets.only(bottom: 80),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: slideList.length,
                                          itemBuilder: (context, index) {
                                            return index == _currentPage
                                                ? SlideDots(true)
                                                : SlideDots(false);
                                          })
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          _currentPage == 2 ?

                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 1000),
                                  height: 60.0,
                                  width: 200,
                                  decoration: BoxDecoration(
                            
                                    borderRadius:
                                    BorderRadius.circular(10),


                                    color: !isYes1 ? Constants.APP_BACKGROUND_COLOR : Constants.APP_DARK_BLUE_COLOR,
                                  ),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,


                                          children: [
                                            InkWell(
                                              onTap: isYesOne,
                                              child:
                                              const SizedBox(
                                                // color: Colors.red,
                                                height: 50,
                                                width: 50,
                                                child: Center(
                                                  child: Text(
                                                    "Login",
                                                    textScaleFactor: 1.0,
                                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                                  ),
                                                ),
                                              ),),

                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen())),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            // BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(0)),
                                            BorderRadius.circular(30),
                                            // border: Border.all(width: 3,color: Colors.green,style: BorderStyle.solid)
                                          ),
                                          height: 60.0,
                                          width: 350.0,
                                          key: UniqueKey(),
                                          // color: Colors.red,
                                          child: const Center(
                                            child: Text(
                                              "Login",
                                              textScaleFactor: 1.2,
                                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )



                              :
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {

                                  _currentPage = 2;


                                  _pageController.animateToPage(
                                    _currentPage,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInCubic,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.circular(25.0),

                                  ),
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: 40.0,
                                  child: const Center(
                                    child: AutoSizeText(
                                      'Skip',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center,
                                      minFontSize: 14,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {

                                  if (_currentPage < 2) {
                                    _currentPage++;
                                  } else {
                                    _currentPage = 0;
                                  }

                                  _pageController.animateToPage(
                                    _currentPage,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInCubic,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.circular(25.0),

                                  ),
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  height: 40.0,
                                  child: const Center(
                                    child: AutoSizeText(
                                      'Next',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal),
                                      textAlign: TextAlign.center,
                                      minFontSize: 14,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 25,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
