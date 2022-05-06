import 'package:flutter/material.dart';
import 'package:schef/managerviews/Resturant/viewmachine.dart';
import 'package:schef/managerviews/Resturant/viewresturantant.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';

import '../../contactform.dart';
import 'addmachine.dart';
import 'addresturtant.dart';

class ResturtantView extends StatelessWidget {
  const ResturtantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    var checkBoxValue = false;
    return Scaffold(
      key:_scaffoldState ,
      drawer: ManagerDrawer(context),

      backgroundColor: Colors.black,
    body: SafeArea(
      child: Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ContactForm()));
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0,right: 30),
              child: Image.asset("assets/main_logo.png",height: 30,width: 30,),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 340,
                width: 330,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddResturant() ));
                        },
                        child: Container(
                            height: 70,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(

                                children: [
                                  Image.asset("assets/add_image.jpg",width: 30,height: 30,),
                                  SizedBox(width: 50,),
                                  Center(child: Text("Add Restaurant", textScaleFactor: 1.1,))
                                ],),
                            )),
                      ) ,
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>viewResturtant() ));
                        },
                        child: Container(
                            height: 70,
                            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(

                                children: [
                                  Image.asset("assets/kitchen_image.jpg",width: 30,height: 30,),
                                  SizedBox(width: 50,),
                                  Center(child: Text("View Restaurant", textScaleFactor: 1.1,))
                                ],),
                            )),
                      ) ,
                      SizedBox(height: 15,),
                  InkWell(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  AddMachine() ));
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(

                          children: [
                            Image.asset("assets/oven_image.jpg",width: 30,height: 30,),
                            SizedBox(width: 50,),
                            Center(child: Text("Add Machine", textScaleFactor: 1.1,))
                          ],),
                      )),
                  ) ,
                      // SizedBox(height: 15,),
                      // InkWell(
                      //   onTap: (){
                      //
                      //
                      //   },
                      //   child: Container(
                      //       height: 70,
                      //       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      //
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      //         child: Row(
                      //
                      //           children: [
                      //           Icon(Icons.view_compact, color: Colors.black),
                      //           SizedBox(width: 70,),
                      //           Center(child: Text("View Machine", textScaleFactor: 1.1,))
                      //         ],),
                      //       ) ,
                      //       //
                      //       // ListTile(leading: Container(
                      //       //     alignment: Alignment.centerLeft,
                      //       //     child: Icon(Icons.view_compact, color: Colors.black)), title: Container(
                      //       //     alignment: Alignment.center,
                      //       //     child: Text("View Machine", textScaleFactor: 1.1,)),  )
                      //
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )),
        ),


        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
                onTap: () => _scaffoldState.currentState!.openDrawer(),
                child: const Icon(
                  Icons.view_list,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ),
      ],),
    ),

    );
  }
}

