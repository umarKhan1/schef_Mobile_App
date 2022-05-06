import 'package:flutter/material.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';


class ViewRecipe extends StatefulWidget {
  const ViewRecipe({Key? key}) : super(key: key);

  @override
  _ViewRecipeState createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
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
                                      height: 160,
                                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Recipe Name:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("Alferado pasta",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),

                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Slug:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("alferado-pasta-recipe",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Excerpt:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("chicken Pasta",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Procedure:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Container(
                                                width: 200,
                                                child: Text("Put some olives ,chicken and jalpenos,lasagna",maxLines: 2,  style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                                  textScaleFactor:0.8,),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Created By:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("Jane",  style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                                textScaleFactor:0.8,),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Ingredients:",  style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                                textScaleFactor:0.8,),
                                              SizedBox(width: 10,),
                                              Text("Olive, Jalpenos,rice,chicken",  style: TextStyle(
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
