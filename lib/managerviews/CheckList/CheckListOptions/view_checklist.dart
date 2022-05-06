import 'package:flutter/material.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';


class ViewCheckList extends StatefulWidget {
  const ViewCheckList({Key? key}) : super(key: key);

  @override
  _ViewCheckListState createState() => _ViewCheckListState();
}

class _ViewCheckListState extends State<ViewCheckList> {
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
                //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=> ContactForm()));
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
                                      height: 150,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Checklist Name:",  style: TextStyle(
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
                                              Text("Machine Name:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("Machine 1",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Assign By:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("Kevin",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Assign To:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("Employee 2",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),

                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Created Date:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("2022-02-01",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Updated Date:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("2022-02-01",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Active Status:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Container(
                                                padding: EdgeInsets.symmetric(horizontal: 10),
                                                color: Colors.red,
                                                child: Text("No",  style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                  textScaleFactor:0.8,),
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
