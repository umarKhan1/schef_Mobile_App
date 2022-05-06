import 'package:flutter/material.dart';

import 'managerviews/managerdrawer/managerdrawer.dart';
class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  String dropdownValue = 'Restaurant';

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
        child: Container(

          child: Stack(children: [

            Padding(
              padding: EdgeInsets.only(top:130.0, left: 62),
              child: Container(
                child: Text("SCHEF Contact Form", textScaleFactor: 1.6, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 0),
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
                                height: 100,
                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),

                                child: TextFormField(
                                  maxLines: 10,
                                  minLines: 1,
                                  textAlign: TextAlign.start,

                                  decoration: InputDecoration(hintText: 'Your Message',


                                     border: InputBorder.none, contentPadding: EdgeInsets.all(22) + EdgeInsets.only(top: 5), ),)) ,


                            SizedBox(height: 15,),
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
                          ],
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
      ),

    );
  }
}
