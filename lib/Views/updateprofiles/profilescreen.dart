import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schef/API/global.dart';
import 'package:schef/Views/updateprofiles/editprofile.dart';
import 'package:schef/widgets/text/text_widget.dart';




class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.black,

      child: SafeArea(
        child: Scaffold(

          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [

                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            name.toString() == ""?  "Michael":name.toString(),
                              false,
                              fontWeight:    FontWeight.w700,textScale:       1.6 ,textColor: Colors.white,
                          ),
                          const SizedBox(height: 7,),
                          TextWidget(
                            number.toString() == ""? "+17788196431":number.toString(),
                            false,
                            fontWeight:    FontWeight.w700,textScale:       1.0 ,textColor: Colors.white,
                          ),


                        ],
                      ),
                      CircleAvatar(

                        child: Image.asset("assets/profileimg.png"),
                        radius: 50,
                      )



                    ],
                  ),

                ),


          const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    children: [
                      TextWidget(
                        "UserName",
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.black,
                      ),
                      Spacer(),
                      TextWidget(
                        number.toString() == ""?     "Micheal":   number.toString(),
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.grey.withOpacity(0.7),
                      ),
                    
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Divider(
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.1),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    children: [
                      TextWidget(
                        "Phone Number",
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.black,
                      ),
                      const Spacer(),
                      TextWidget(
                        number.toString() == ""?   "+17788196431":   number.toString(),
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.grey.withOpacity(0.7),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Divider(
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.1),
                ),

                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    children: [
                      TextWidget(
                        "Address",
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.black,
                      ),
                      const Spacer(),
                      TextWidget(
                       address.toString() == ""? "189 Avenue Street": address.toString(),
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.grey.withOpacity(0.7),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Divider(
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.1),
                ),

                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    children: [
                      TextWidget(
                        "Email",
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.black,
                      ),
                      const Spacer(),
                      TextWidget(
                        email.toString() ==""?    "Micheal@Gmail.com":  email.toString(),
                        false,
                        fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.grey.withOpacity(0.7),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Divider(
                  thickness: 2,
                  color: Colors.grey.withOpacity(0.1),
                ),
          Spacer(),
          Padding(
            padding:  const EdgeInsets.only(bottom: 25.0),
            child: InkWell(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const EditProfile())),

              child: Container(
                height: MediaQuery.of(context).size.height/12,
                width: MediaQuery.of(context).size.width/1.6,
                decoration:  BoxDecoration(
                  borderRadius:  BorderRadius.circular(10),
                  color: Colors.black,

                 // borderRadius: BorderRadius.circular(10),
                ),
              child: Center(child: TextWidget(
                "Update Profile",
                false,
                fontWeight:    FontWeight.w700,textScale:       1.2 ,textColor: Colors.white,
              ),),
              ),
            ),
          )
              ],
            ),

          ),



        ),
      ),
    );
  }
}