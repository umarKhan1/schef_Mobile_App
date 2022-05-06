import 'package:flutter/material.dart';
import 'package:schef/managerviews/managerdrawer/managerdrawer.dart';

import '../../contactform.dart';

class AddMachine extends StatefulWidget {
  const AddMachine({Key? key}) : super(key: key);

  @override
  _AddMachineState createState() => _AddMachineState();
}
enum Selection { yes, no }
class _AddMachineState extends State<AddMachine> {
  String dropdownValue = 'Restaurant';
  int _groupValue = -1;
  Selection _pet = Selection.yes;
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

                  width: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Form(
                      key:_formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Container(
                              height: 70,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                              child: TextFormField(

                                decoration: InputDecoration(hintText: 'Name', border: InputBorder.none,contentPadding: EdgeInsets.all(20) + EdgeInsets.only(top: 5), ),)) ,
                          SizedBox(height: 10,),
                          Container(
                              height: 70,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                              child: TextFormField(
                                textAlign: TextAlign.start,

                                decoration: InputDecoration(hintText: 'Serial ID',   border: InputBorder.none, contentPadding: EdgeInsets.all(22) + EdgeInsets.only(top: 5), ),)) ,
                          SizedBox(height: 10,),
                          Container(
                              height: 70,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)), child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              style: TextStyle(color: Colors.black,fontSize: 18.0),
                              isExpanded: true,
                              icon: SizedBox.shrink(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                                print(newValue!);
                              },

                              underline:Container(),
                              items: <String>['Restaurant', 'MacDonald', 'KFC', 'Kfc4', ] .map<DropdownMenuItem<String>>((
                                  String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: TextStyle(color: Colors.black), textScaleFactor: 1,),
                                );
                              }).toList(),

                            ),
                          ) ),
                          SizedBox(height: 20,),

                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 10.0),
                               child: Text("Active Status", textScaleFactor: 1.1, style: TextStyle(color: Colors.white),),
                             ),

                          Theme(
                            data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                                disabledColor: Colors.blue
                            ),
                            child: Row(
                              children: [
                                Radio<Selection>(
                                  value: Selection.yes,
                                  focusColor: Colors.white,
                                  activeColor: Colors.white,
                                  hoverColor: Colors.white,
                                  groupValue: _pet,
                                  onChanged: (Selection? value) {
                                    setState(() {
                                      _pet = value!;
                                    });
                                  },
                                ),
                                Text("Yes", textScaleFactor: 1.1, style: TextStyle(color: Colors.white),),
                                Radio<Selection>(
                                  value: Selection.no,
                                  focusColor: Colors.white,
                               //   fillColor: Colors.white,
                activeColor: Colors.white,
                                  hoverColor: Colors.white,
                                  groupValue: _pet,
                                  onChanged: (Selection? value) {
                                    setState(() {
                                      _pet = value!;
                                    });
                                  },
                                ),
                                Text("No", textScaleFactor: 1.1, style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),

                           SizedBox(height: 15,),

                        ],
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
