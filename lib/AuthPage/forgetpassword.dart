
import 'package:flutter/material.dart';
import 'package:schef/AuthPage/loginpage.dart';

import 'package:schef/widgets/text/text_widget.dart';

import '../constant.dart';


class Forgetpass extends StatefulWidget {


  @override
  _ForgetpassState createState() => _ForgetpassState();
}



class _ForgetpassState extends State<Forgetpass> {

  String email = "";


  final _formKey = GlobalKey<FormState>();
  final getEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Form(
              key: _formKey,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.white,size: 30,
                          ),
                          onTap: (){
                           Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));
                          },
                        ),


                      ],
                    ),
                  ),
                  TextWidget(
                    "Wachtwoord vergeten",
                    false, textScale: 2.0, textColor: Colors.white, fontWeight: FontWeight.bold,



                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/1.3,
                    child: TextWidget(
                      "Om uw wachtwoord te resetten dient u hieronder uw emailares in te vullen. vul hier emailadres in",
                      false,
                      textColor: Colors.grey, textScale: 1, fontWeight: FontWeight.w700,),
                  ),
                  const SizedBox(height: 30,),
                  Image.asset(
                    'assets/forgetpass.png',
                    height: MediaQuery.of(context).size.height/3.4,
                    width: MediaQuery.of(context).size.width/1.5,

                  ),
                  const SizedBox(height: 20,),


                  Container(
                    width: MediaQuery.of(context).size.width/1.2,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),

                      //    color:  Colors.white,

                    ),
                    child: TextFormField(
                      controller: getEmail,

                      decoration: const InputDecoration(

                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color:  Colors.grey,
                        ),

                        labelText: "Enter your email address",
                        labelStyle: TextStyle(
                            color:  Colors.grey,
                            fontSize: 16,
                            fontFamily: 'Enter your email address'
                        ),


                        enabledBorder: UnderlineInputBorder(

                          borderSide: BorderSide(
                            color:  Colors.white,
                          ),
                        ),
                        focusedBorder:UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2.0),

                        ),
                        fillColor: Colors.white,


                      ),
                      // validator: (val) {
                      //   if(val.length==0) {
                      //     return "Email cannot be empty";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'pnregular',
                          fontSize: 17
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.6,
                        height: 48,
                        child: Center(
                          child:   TextWidget(
                            "Send",
                            false,




                            fontWeight:   FontWeight.w800, textColor:   Colors.black, textScale:                 1.2,),
                        ),

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,

                        ),

                      ),
                    ),
                    onTap: (){
                      //     if(_formKey.currentState!.validate()){
                      //   auth.sendPasswordResetEmail(email: getEmail.text.toString());
                      //   Navigator.pushReplacement(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) =>
                      //               Signin()));
                      // }
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginScreen()));

                    },

                  ),

                ],
              ),
            ),

          ),
        ),

      ),
    );
  }
}