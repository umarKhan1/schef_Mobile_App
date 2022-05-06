
import 'package:flutter/material.dart';
import 'package:schef/constant.dart';
import 'package:schef/widgets/text/text_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(


        child: Stack(children: [
          const SizedBox(height: 20,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(

                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.arrow_back,
                        color:Colors.black,
                      ),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(width: 10,),
                    TextWidget(
                        "Edit Information",
                        false,



textColor: Colors.black, fontWeight:   FontWeight.w600, textScale:             1.8, textAlign: TextAlign.center,),

                  ],
                ),
              ),

              const SizedBox(height: 40,),
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  children: [
                    CircleAvatar(

                      child: Image.asset("assets/profileimg.png"),
                      radius: 60,
                    ),
                    const Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.black,
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 23,

                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  30.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Your Name",
                        contentPadding: EdgeInsets.all(15),

                        border: InputBorder.none,prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.grey,size: 30,)

                        , helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 20,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  30.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Your Phone",
                        contentPadding: EdgeInsets.all(15),

                        border: InputBorder.none,prefixIcon: Icon(Icons.phone, color: Colors.grey,size: 30,)

                        , helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 20,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  30.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Your Address",
                        contentPadding: EdgeInsets.all(15),

                        border: InputBorder.none,prefixIcon: Icon(Icons.location_on, color: Colors.grey,size: 30,)

                        , helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                  ),

                ),
              ),
              const SizedBox(height: 20,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  30.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: "Enter Your Email",
                        contentPadding: EdgeInsets.all(15),

                        border: InputBorder.none,prefixIcon: Icon(Icons.email, color: Colors.grey,size: 30,)

                        , helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                    ),
                  ),

                ),
              ),




            ],
          ),

          InkWell(
            onTap:()=> Navigator.pop(context, true),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                  decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50), )
                   , color: Colors.black,),
child: Center(child:       TextWidget(
  "Update Profile",
  false,



  textColor: Colors.white, fontWeight:   FontWeight.w600, textScale:             1.4, textAlign: TextAlign.center,), ),


              ),
            ),
          )
        ],),
      ),
    );
  }
}

