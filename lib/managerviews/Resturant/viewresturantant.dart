import 'package:flutter/material.dart';
import 'package:schef/managerviews/Resturant/viewmachine.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';

import '../../contactform.dart';


class viewResturtant extends StatefulWidget {
  const viewResturtant({Key? key}) : super(key: key);

  @override
  _viewResturtantState createState() => _viewResturtantState();
}

class _viewResturtantState extends State<viewResturtant> {
  String dropdownValue = 'Select Organization';
  final  _scaffoldState = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
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
            padding: const EdgeInsets.only(top: 85.0),
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 400,
                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key:_formKey,
                      child: Container(child: Scrollbar(

                        thickness: 8,
                        radius: Radius.circular(15),
                        child: ListView.builder(
                            itemCount: 4,
                            itemBuilder: (BuildContext context, int index){
                          return     Column(
                            children: [
                              Container(
                                  height: 200,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text("NAME:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Spike John",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("ORGANIZATION:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Organization 1",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("EMAIL:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Schef@info.com",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("WEBSITE:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Schef.xyz",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("ADDRESS:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Dummy house street 12 USA",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("NO OF EMPLOYEE:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("123",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("CITY:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Dummy City",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("COUNTRY:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Text("Dummy Country",  style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600,
                                          ),
                                            textScaleFactor:0.8,),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text("MACHINE:",  style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                            textScaleFactor:0.8,),
                                          SizedBox(width: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                color: Colors.red,
                                                child: Text("Not Assigned",  style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                  textScaleFactor:0.8,),
                                              ),

                                              SizedBox(width: 20,),
                                              InkWell(
                                                onTap:(){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>  ViewMachine() ));},
                                                child: Container(height: 30,  width:60, decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)), child:  Center(
                                                  child: Text("View Machine",  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                    textAlign: TextAlign.center,
                                                    textScaleFactor:0.7,),
                                                ),),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),


                                    ],)
                              ) ),

                              SizedBox(height: 10,)
                            ],
                          );
                        }),
                      ),
                      ),
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
