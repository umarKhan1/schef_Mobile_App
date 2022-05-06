import 'package:flutter/material.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';


class AddRecipe extends StatefulWidget {
  const AddRecipe({Key? key}) : super(key: key);

  @override
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  String dropdownValue = 'Select Machine';
  String dropdownValue1 = 'Select Ingredients';
  String dropdownValue2 = 'Select User';
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
                      child: Scrollbar
                        (

                        thickness: 8,
                        radius: Radius.circular(15),
                        child: ListView(
                          children:  [
                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(

                                  decoration: InputDecoration(hintText: 'Name', border: InputBorder.none,contentPadding: EdgeInsets.all(20), ),)) ,

                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(

                                  decoration: InputDecoration(hintText: 'Slug', border: InputBorder.none,contentPadding: EdgeInsets.all(20), ),)) ,

                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(

                                  decoration: InputDecoration(hintText: 'Excerpt', border: InputBorder.none,contentPadding: EdgeInsets.all(20), ),)) ,
                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(

                                  decoration: InputDecoration(hintText: 'Procedure', border: InputBorder.none,contentPadding: EdgeInsets.all(20), ),)) ,

                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(

                                  decoration: InputDecoration(hintText: 'Phone', border: InputBorder.none,contentPadding: EdgeInsets.all(20), ),)) ,

                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(

                                  decoration: InputDecoration(hintText: 'No. of Staff', border: InputBorder.none,contentPadding: EdgeInsets.all(20), ),)) ,

                            SizedBox(height: 10,),
                            Container(
                                height: 70,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: DropdownButton<String>(
                                value: dropdownValue1,
                                style: TextStyle(color: Colors.black,fontSize: 18.0),
                                isExpanded: true,
                                icon: SizedBox.shrink(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue1 = newValue!;
                                  });
                                  print(newValue!);
                                },

                                underline:Container(),
                                items: <String>['Select Ingredients', 'recipe1', 'recipe1', 'recipe1', 'recipe1'] .map<DropdownMenuItem<String>>((
                                    String value){
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: TextStyle(color: Colors.black), textScaleFactor: 1,),
                                  );
                                }).toList(),

                              ),
                            ) ),


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
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                      onTap: () => null,
                      child: Container(height: 50, width: 160, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text("Submit", textScaleFactor: 1, style: TextStyle(fontWeight: FontWeight.w600),) ),
                      )
                  ))
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