import 'package:flutter/material.dart';
import 'package:schef/managerviews/CheckList/CheckListOptions/add_check_list.dart';
import 'package:schef/managerviews/CheckList/CheckListOptions/assign_checklist.dart';
import 'package:schef/managerviews/CheckList/CheckListOptions/delegate_checklist.dart';
import 'package:schef/managerviews/CheckList/CheckListOptions/fill_checklist.dart';
import 'package:schef/managerviews/CheckList/CheckListOptions/view_checklist.dart';
import 'package:schef/managerviews/CheckList/CheckListOptions/view_detail_checklist.dart';
import 'package:schef/managerviews/RecipesList/add_recipe.dart';
import 'package:schef/managerviews/RecipesList/view_recipe.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';

import '../../contactform.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
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
                      child: Scrollbar
                        (

                        thickness: 8,
                        radius: Radius.circular(15),
                        child: ListView(
                          children: [
                            SizedBox(height: 15,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRecipe() ));
                              },
                              child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Row(

                                      children: [
                                        Icon(Icons.fastfood, color: Colors.black),
                                        SizedBox(width: 40,),
                                        Center(child: Text("Add Recipes", textScaleFactor: 1.1,))
                                      ],),
                                  )),
                            ) ,
                            SizedBox(height: 15,),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRecipe() ));
                              },
                              child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                    child: Row(

                                      children: [
                                        Icon(Icons.fastfood, color: Colors.black),
                                        SizedBox(width: 40,),
                                        Center(child: Text("View Recipes", textScaleFactor: 1.1,))
                                      ],),
                                  )),
                            ) ,




                          ],
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
