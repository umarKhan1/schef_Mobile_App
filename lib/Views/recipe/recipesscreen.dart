import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:schef/API/api.dart';
import 'package:schef/API/global.dart';
import 'package:schef/AuthPage/loginpage.dart';
import 'package:schef/drawer/bottomscreen.dart';
import 'package:schef/models/recipe_models.dart';
import 'package:schef/widgets/text/text_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant.dart';
import 'detailrecipe.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({Key? key}) : super(key: key);

  @override
  _RecipeScreenState createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final search = TextEditingController();

  List<Allrecipe> Allrecipelistduplicate=[];

  var checkfound=false;

  void waittosearch() async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (success == 'true') {
        EasyLoading.dismiss();
        clickstatus = true;

        print("search done");

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => Dashboard())
        // );

      } else if (success == 'error') {
        clickstatus = true;
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg:  "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        waittosearch();
      }
    });
  }


  void waittogetingridents(var name,var image,var excerpt,var procedure) async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (success == 'true') {
        EasyLoading.dismiss();
        clickstatus = true;


        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsRecipes(name: name,image: image,excerpt: excerpt,procedure: procedure,)));


      } else if (success == 'error') {
        clickstatus = true;
        EasyLoading.dismiss();
        Fluttertoast.showToast(
            msg:  "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        waittogetingridents(name,image,excerpt,procedure);
      }
    });
  }


  void searching(String val){

    setState(() {
      Allrecipelistduplicate=[];
    });

    if(val.toString()=="")
      {
        setState(() {
          Allrecipelistduplicate=[];
          checkfound=false;
        });

      }
    else{
      for(int i=0;i<Allrecipelist.length;i++)
      {
        if(Allrecipelist[i].name.toString().startsWith(val))
        {
          setState(() {
            Allrecipelistduplicate.add(Allrecipe(
              id: Allrecipelist[i].id,
              image: Allrecipelist[i].image,
              name: Allrecipelist[i].name,
              excerpt: Allrecipelist[i].excerpt,
              procedure: Allrecipelist[i].procedure,

            ));
            checkfound=false;
          });

          print(val);

        }
        else{
          setState(() {
            checkfound=true;
          });


        }
      }
    }




  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldState,
      drawer: DrawerScreen(context),

      body: SafeArea(
        child: SingleChildScrollView(

          physics: const NeverScrollableScrollPhysics(),
          child: Column(children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  10.0),
              child:

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [


                  InkWell(
                      onTap: ()=>   _scaffoldState.currentState!.openDrawer(),
                      child: const Icon(Icons.view_list, size: 30,)),

                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: TextFormField(
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Something';
                        }
                        return null;
                      },
                      controller: search,
                      onChanged: (val){

                        searching(val);




                      },
                      // onFieldSubmitted: (val)async{
                      //   clickstatus = false;
                      //   EasyLoading.show(
                      //     status: 'loading...',
                      //     maskType: EasyLoadingMaskType.black,
                      //   );
                      //
                      //   Api.searchRecipes(search.text.toString());
                      //   waittosearch();
                      //
                      // },
                      decoration: const InputDecoration(hintText: "Search Work",
                          contentPadding: EdgeInsets.all(15),

                          border: InputBorder.none,prefixIcon: Icon(Icons.search, color: Colors.black,size: 30,)

                          , helperStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)
                      ),
                    ),

                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            // checkfound?Container(
            //   child: const Center(
            //     child: Text("nahe milla"),
            //   ),
            // ):Container(),
            checkfound?Container(
              child: const Center(
                child: Text("No results found"),
              ),
            ): Allrecipelistduplicate.length >0? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount:Allrecipelistduplicate.length,
                      itemBuilder: (BuildContext context, int index) => index.isEven
                          ? Container(
                        height: MediaQuery.of(context).size.height / 4.4,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Stack(
                          children: [
                            Align(
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height / 4.8,
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextWidget(
                                            Allrecipelistduplicate[index].name.toString(),
                                            false,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w900,
                                            textColor: Colors.black,
                                            textScale: 1.2,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextWidget(
                                            Allrecipelistduplicate[index].excerpt.toString(),
                                            false,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w600,
                                            textColor: Colors.black,
                                            textScale: 1,
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: (){


                                                  EasyLoading.show(
                                                    status: 'loading...',
                                                    maskType: EasyLoadingMaskType.black,
                                                  );
                                                  Api.getingrediants(Allrecipelistduplicate[index].id.toString());
                                                  waittogetingridents(Allrecipelistduplicate[index].name.toString()
                                                    ,Allrecipelistduplicate[index].image.toString(),
                                                    Allrecipelistduplicate[index].excerpt.toString(),
                                                    Allrecipelistduplicate[index].procedure.toString(),
                                                  );

                                                  // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsRecipes()));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      4.5,
                                                  height: 30,
                                                  decoration: const BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(3.0),
                                                      bottomLeft:
                                                      Radius.circular(3.0),
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                  child: const Center(
                                                      child: Text('View More',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .white))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Allrecipelistduplicate[index].image!=null?
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(

                                        Allrecipelistduplicate[index].image,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width:120,

                                      ),
                                    ),
                                  )
                                      :Image.asset(
                                    "assets/dinner.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(
                        height: MediaQuery.of(context).size.height / 4.4,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Stack(
                          children: [
                            Align(
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height / 4.8,
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width / 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextWidget(
                                              Allrecipelistduplicate[index].name,
                                              false,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w900,
                                              textColor: Colors.black,
                                              textScale: 1.2,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextWidget(
                                              Allrecipelistduplicate[index].excerpt,
                                              false,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w600,
                                              textColor: Colors.black,
                                              textScale: 1,
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8, left: 0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: InkWell(
                                                  onTap: (){
                                                    EasyLoading.show(
                                                      status: 'loading...',
                                                      maskType: EasyLoadingMaskType.black,
                                                    );
                                                    Api.getingrediants(Allrecipelistduplicate[index].id.toString());
                                                    waittogetingridents(Allrecipelistduplicate[index].name.toString()
                                                      ,Allrecipelistduplicate[index].image.toString(),
                                                      Allrecipelistduplicate[index].excerpt.toString(),
                                                      Allrecipelistduplicate[index].procedure.toString(),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                        4.5,
                                                    height: 25,
                                                    decoration:
                                                    const BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.only(
                                                        topRight:
                                                        Radius.circular(4.0),
                                                        bottomRight:
                                                        Radius.circular(4.0),
                                                      ),
                                                      color: Colors.black,
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'View More',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Colors
                                                                    .white))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Allrecipelistduplicate[index].image!=null?
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(

                                        Allrecipelistduplicate[index].image,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width:120,

                                      ),
                                    ),
                                  )
                                      :Image.asset(
                                    "assets/dinner.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                alignment: Alignment.topRight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ):SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      //physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount:Allrecipelist.length,
                      itemBuilder: (BuildContext context, int index) => index.isEven
                          ? Container(
                        height: MediaQuery.of(context).size.height / 4.4,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Stack(
                          children: [
                            Align(
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height / 4.8,
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width / 2,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextWidget(
                                            Allrecipelist[index].name.toString(),
                                            false,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w900,
                                            textColor: Colors.black,
                                            textScale: 1.2,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          TextWidget(
                                            Allrecipelist[index].excerpt.toString(),
                                            false,
                                            textAlign: TextAlign.left,
                                            fontWeight: FontWeight.w600,
                                            textColor: Colors.black,
                                            textScale: 1,
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: InkWell(
                                                onTap: (){


                                                  EasyLoading.show(
                                                    status: 'loading...',
                                                    maskType: EasyLoadingMaskType.black,
                                                  );
                                                  Api.getingrediants(Allrecipelist[index].id.toString());
                                                 waittogetingridents(Allrecipelist[index].name.toString()
                                                     ,Allrecipelist[index].image.toString(),
                                                     Allrecipelist[index].excerpt.toString(),
                                                     Allrecipelist[index].procedure.toString(),
                                                 );

                                                  // Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsRecipes()));
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      4.5,
                                                  height: 30,
                                                  decoration: const BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.only(
                                                      topLeft:
                                                      Radius.circular(3.0),
                                                      bottomLeft:
                                                      Radius.circular(3.0),
                                                    ),
                                                    color: Colors.black,
                                                  ),
                                                  child: const Center(
                                                      child: Text('View More',
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .white))),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Allrecipelist[index].image!=null?
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(

                                          Allrecipelist[index].image,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width:120,

                                      ),
                                    ),
                                  )
                                      :Image.asset(
                                    "assets/dinner.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                              ),
                            )
                          ],
                        ),
                      )
                          : Container(
                        height: MediaQuery.of(context).size.height / 4.4,
                        width: MediaQuery.of(context).size.width / 1.1,
                        child: Stack(
                          children: [
                            Align(
                              child: Container(
                                height:
                                MediaQuery.of(context).size.height / 4.8,
                                width: MediaQuery.of(context).size.width / 1.1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          3, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width / 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextWidget(
                                              Allrecipelist[index].name,
                                              false,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w900,
                                              textColor: Colors.black,
                                              textScale: 1.2,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            TextWidget(
                                              Allrecipelist[index].excerpt,
                                              false,
                                              textAlign: TextAlign.left,
                                              fontWeight: FontWeight.w600,
                                              textColor: Colors.black,
                                              textScale: 1,
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8, left: 0),
                                              child: Align(
                                                alignment: Alignment.bottomLeft,
                                                child: InkWell(
                                                  onTap: (){
                                                    EasyLoading.show(
                                                      status: 'loading...',
                                                      maskType: EasyLoadingMaskType.black,
                                                    );
                                                    Api.getingrediants(Allrecipelist[index].id.toString());
                                                    waittogetingridents(Allrecipelist[index].name.toString()
                                                      ,Allrecipelist[index].image.toString(),
                                                      Allrecipelist[index].excerpt.toString(),
                                                      Allrecipelist[index].procedure.toString(),
                                                    );
                                                  },
                                                  child: Container(
                                                    width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                        4.5,
                                                    height: 25,
                                                    decoration:
                                                    const BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.only(
                                                        topRight:
                                                        Radius.circular(4.0),
                                                        bottomRight:
                                                        Radius.circular(4.0),
                                                      ),
                                                      color: Colors.black,
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'View More',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: Colors
                                                                    .white))),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                              alignment: Alignment.bottomCenter,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Align(
                                child: Container(
                                  height: 120,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Allrecipelist[index].image!=null?
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(120),
                                      child: Image.network(

                                        Allrecipelist[index].image,
                                        fit: BoxFit.fill,
                                        height: 120,
                                        width:120,

                                      ),
                                    ),
                                  )
                                      :Image.asset(
                                    "assets/dinner.png",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                alignment: Alignment.topRight,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
