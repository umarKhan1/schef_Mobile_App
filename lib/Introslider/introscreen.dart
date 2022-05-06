import 'package:flutter/material.dart';
import 'package:schef/AuthPage/loginoption.dart';
import 'package:schef/AuthPage/loginpage.dart';
import 'package:schef/managerviews/homescreen.dart';
import 'package:schef/widgets/text/text_widget.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(alignment: Alignment.center, child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 100, width: 100, child : Image.asset("assets/main_logo.png",)),

              TextWidget(
                "Welkom bij Schef!",
                false,




                fontWeight:FontWeight.w900, textScale:     2.1, textColor:   Colors.white,          textAlign:        TextAlign.start,),
                SizedBox(height: 20,),
                TextWidget(
                  "Om gebruik te maken van Schef kunt u hieronder inloggen. indien u nog geen account hebt neem contact op met uw leidinggevende",
                  false,




                  fontWeight:FontWeight.w900, textScale:     1, textColor:   Colors.white,          textAlign:        TextAlign.center,),
            ],),
          ),),

          // Padding(
          //    padding: const EdgeInsets.only(bottom: 80),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: InkWell(
          //       onTap: ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen())),
          //       child: Container(
          //         width: MediaQuery.of(context).size.width/2.1,
          //         height: 50,
          //
          //         decoration: const BoxDecoration(
          //             borderRadius: BorderRadius.only(
          //
          //               topLeft: Radius.circular(10.0),
          //
          //               bottomLeft: Radius.circular(10.0),
          //
          //             ),
          //             color: Colors.white,
          //
          //         ),
          //         child: Row(
          //           children: [
          //             const Spacer(),
          //             TextWidget(
          //                 "Login",
          //                 false,
          //                 fontWeight:FontWeight.w500, textScale:     1, textColor:   Colors.black.withOpacity(0.7),          textAlign:        TextAlign.start,),
          //             const Spacer(),
          //             Icon(
          //               Icons.arrow_forward,
          //               color:Colors.black.withOpacity(0.7),
          //
          //             ),
          //             const SizedBox(width: 20,)
          //
          //           ],
          //         ),
          //
          //
          //
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: Alignment.bottomRight,
              child:   InkWell(
                onTap: ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> ManagerDashboard())),
                child: Container(
                  width: MediaQuery.of(context).size.width/2.1,
                  height: 50,

                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(

                      topLeft: Radius.circular(10.0),

                      bottomLeft: Radius.circular(10.0),

                    ),
                    color: Colors.white,

                  ),
                  child: Row(
                    children: [
                      const Spacer(),
                      TextWidget(
                        "Login",
                        false,
                        fontWeight:FontWeight.w500, textScale:     1, textColor:   Colors.black.withOpacity(0.7),          textAlign:        TextAlign.start,),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward,
                        color:Colors.black.withOpacity(0.7),

                      ),
                      const SizedBox(width: 20,)

                    ],
                  ),



                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
