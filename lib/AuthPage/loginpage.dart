import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schef/API/api.dart';
import 'package:schef/API/global.dart';
import 'package:schef/Views/home.dart';
import 'package:schef/Views/roster/rosterscreen.dart';


import 'package:schef/widgets/Image/imageWidget.dart';
import 'package:schef/widgets/curvecontainers.dart';
import 'package:schef/widgets/text/text_widget.dart';
import 'package:schef/widgets/textfields/rounded_textfield.dart';

import '../constant.dart';
import 'forgetpassword.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}
var clickstatus = true;

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();

  final password = TextEditingController();


/*  String Function(String?) emailvalidator = (String? username) {
    if (username=="") {
      return 'email empty';
    }
    return null!;
  };
  String Function(String?) passwordfunction = (String? password) {
    if (password!.isEmpty) {
      return 'password empty';
    }
    return null!;
  };*/
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void waittologin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (success == 'true') {
        EasyLoading.dismiss();
        clickstatus = true;


        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  home()));

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => Dashboard())
        // );

      } else if (success == 'error') {
        clickstatus = true;
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg:  "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        waittologin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.APP_BACKGROUND_COLOR,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
          const  Image(
              image: AssetImage('assets/mainlogo.png'),
              fit: BoxFit.cover,
              width: 160,
            height: 200,
            ),
         const   SizedBox(
              height: 20,
            ),
       SizedBox(
              height: 500,
              width: 500,
              // color: Colors.white,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(20),
                  //     ),
                  //     height: 60,
                  //     width: 320,
                  //     child: Center(
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(top: 15),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           children: [
                  //             TextWidget(
                  //               'Don\'t have an account? ',
                  //               false,
                  //               textScale: 0.9,
                  //               textColor: Constants.APP_TEXT_GREY_COLOR,
                  //                 fontWeight: FontWeight.bold
                  //             ),
                  //             GestureDetector(
                  //               onTap: (){
                  //                 // Get.to(SignUpScreen());
                  //               },
                  //               child: TextWidget(
                  //                 'Create new account ',
                  //                 false,
                  //                 textScale: 0.9,
                  //                 textColor: Constants.APP_DARK_BLUE_COLOR,
                  //                   fontWeight: FontWeight.bold
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          spreadRadius: 8,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 457,
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: _formKey,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            TextWidget(
                              "Sign in",
                              false,
                              textColor: Colors.black,
                              textScale: 1.8,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget("to Continue", false,textColor: Colors.black,textScale: 1.8,fontWeight: FontWeight.bold,),

                           const SizedBox(
                              height: 20,
                            ),
                            Container(
                                decoration: BoxDecoration(
                                  color: Constants.APP_TEXT_FIELD_COLOR,
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                child: TextFormField(
                                  validator:  (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },

                                  controller: email,
                                  style: TextStyle(fontSize: 12),
                                  // obscureText: isObscure,
                                  decoration:const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email",
                                    // suffixIcon: widget.trailingIcon == true
                                    //     ? GestureDetector(
                                    //     onTap: () {
                                    //       setState(() {
                                    //         isObscure = !isObscure;
                                    //       });
                                    //     },
                                    //     child: const Icon(Icons.remove_red_eye))
                                    //     : const Icon(
                                    //   Icons.remove_red_eye,
                                    //   color: Constants.APP_TEXT_FIELD_COLOR,
                                    // ),
                                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                                    hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                                    enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                    disabledBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                    focusedErrorBorder:OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                  ),
                                )),

                           const SizedBox(
                              height: 20,
                            ),

                            Container(
                                decoration: BoxDecoration(
                                  color: Constants.APP_TEXT_FIELD_COLOR,
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                child: TextFormField(
                                  validator:  (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please Enter Password';
                                    }
                                    return null;
                                  },

                                  controller: password,
                                  style: TextStyle(fontSize: 12),
                                  // obscureText: isObscure,
                                  decoration:const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    // suffixIcon: widget.trailingIcon == true
                                    //     ? GestureDetector(
                                    //     onTap: () {
                                    //       setState(() {
                                    //         isObscure = !isObscure;
                                    //       });
                                    //     },
                                    //     child: const Icon(Icons.remove_red_eye))
                                    //     : const Icon(
                                    //   Icons.remove_red_eye,
                                    //   color: Constants.APP_TEXT_FIELD_COLOR,
                                    // ),
                                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                                    hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                                    enabledBorder:  OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                    errorBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                    disabledBorder:  OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                    focusedErrorBorder:OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    ),
                                  ),
                                )),
                            // RoundedTextField(
                            //   password,
                            //   labelText: "Password",
                            //   trailingIcon: true,
                            //     validator:  (value) {
                            //       if (value == null || value.isEmpty) {
                            //         return 'Please password';
                            //       }
                            //       return "";
                            //     }
                            // ),
                            const SizedBox(
                              height: 20,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: (){
                                      // Get.to(ForgetPassword());

                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Forgetpass()));
                                    },
                                    child: TextWidget("Forgot Password?",false,textColor: Constants.APP_PINE_GREEN_COLOR,fontWeight: FontWeight.normal,textScale: 0.9,))
                              ],
                            ),

                            const SizedBox(height: 20),
                            GestureDetector(
                                onTap: (){
                                  if (_formKey.currentState!.validate()) {


                                    //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>  home()));

                                    clickstatus = false;
                                    EasyLoading.show(
                                      status: 'loading...',
                                      maskType: EasyLoadingMaskType.black,
                                    );

                                    Api.loginAPI(email.text, password.text);
                                    waittologin();
                                }
                                  else{
                                    print("Ponka");
                                  }

                                  },
                                child: const OnTapContainer(false,false,"Login",60,300,borderRadius: 10,containerColor: Constants.APP_BACKGROUND_COLOR,textColor: Constants.APP_WHITE_COLOR,fontWeight: FontWeight.normal,textScale: 1.2,)),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
