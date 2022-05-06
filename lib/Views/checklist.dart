// import 'package:flutter/material.dart';
// import 'package:schef/Views/recipe/detailrecipe.dart';
// import 'package:schef/drawer/bottomscreen.dart';
// import 'package:schef/models/menu.dart';
// import 'package:schef/widgets/text/text_widget.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   List<Menu> menulist = [
//     Menu(img: "assets/appetitzer.png", title: "Appetizer"),
//     Menu(img: "assets/soup.png", title: "Soups"),
//     Menu(img: "assets/ceviches.png", title: "Ceviches"),
//     Menu(img: "assets/ceviches.png", title: "Ceviches"),
//   ];
//
//   final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       key: _scaffoldState,
//       drawer: DrawerScreen(context),
//       //1
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width,
//               child: Image.asset(
//                 'assets/homebg.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//             CustomScrollView(
//               slivers: <Widget>[
//                 //2
//                 SliverAppBar(
//                   expandedHeight: 220.0,
//                   automaticallyImplyLeading: false,
//                   backgroundColor: Colors.transparent,
//                   title: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       InkWell(
//                           onTap: ()=>   _scaffoldState.currentState!.openDrawer(),
//                           child: const Icon(Icons.view_list, size: 30,)),
//                       Container(
//                         width: MediaQuery.of(context).size.width / 1.3,
//                         height: 45,
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.only(
//                             topLeft: Radius.circular(22.0),
//                             bottomLeft: Radius.circular(22.0),
//                             topRight: Radius.circular(22.0),
//                             bottomRight: Radius.circular(22.0),
//                           ),
//                           // color: Constants.pinkishGrey.withOpacity(0.5),
//                           color: Colors.white.withOpacity(0.5),
//                           // gradient: LinearGradient(
//                           //   begin: Alignment.topCenter,
//                           //   end: Alignment.bottomCenter,
//                           //   colors: [
//                           //     Constants.squash,
//                           //     Constants.brownsquash,
//                           //   ],
//                           // )
//                         ),
//                         child: Row(
//                           children: [
//
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const Icon(
//                               Icons.search,
//                               color: Colors.white,
//                               size: 30,
//                             ),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width / 2,
//                               child: TextFormField(
//                                 decoration: const InputDecoration(
//                                   labelText: "Search",
//                                   labelStyle: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontFamily: 'AvenirNextRegular'),
//                                   border: InputBorder.none,
//                                   focusedBorder: InputBorder.none,
//                                   enabledBorder: InputBorder.none,
//                                   errorBorder: InputBorder.none,
//                                   disabledBorder: InputBorder.none,
//                                   fillColor: Colors.white,
//                                 ),
//                                 keyboardType: TextInputType.emailAddress,
//                                 style: const TextStyle(
//                                     color: Colors.white,
//                                     fontFamily: 'AvenirNextRegular',
//                                     fontSize: 17),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   flexibleSpace: FlexibleSpaceBar(
//                     // title: Text('Goa', textScaleFactor: 1),
//                     // centerTitle: true,
//
//                     background: Image.asset(
//                       'assets/homebg.png',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//
//                 SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (_, int index) {
//                       return Container(
//                         height: MediaQuery.of(context).size.height * 2,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(20.0),
//                             topRight: Radius.circular(20.0),
//                           ),
//                           color: Colors.white,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(10.0),
//                               child: Row(
//                                 children: [
//                                   TextWidget(
//                                     "Our Menu",
//                                     false,
//                                     textScale: 1.5,
//                                     textColor: Colors.black,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                   const Spacer(),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             SizedBox(
//                               height: 150,
//                               width: MediaQuery.of(context).size.width,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left: 10),
//                                 child: ListView.builder(
//                                   shrinkWrap: true,
//                                   scrollDirection: Axis.horizontal,
//                                   itemCount: menulist.length,
//                                   itemBuilder:
//                                       (BuildContext context, int index) =>
//                                           Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       children: [
//                                     SizedBox(
//                                         height: 83,
//                                         width: 83,
//                                         child: Image.asset(menulist[index]
//                                             .img
//                                             .toString())),
//                                     const SizedBox(
//                                       height: 10,
//                                     ),
//                                     TextWidget(
//                                       menulist[index].title,
//                                       false,
//                                       textScale: 1.0,
//                                       textColor: Colors.black,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height / 4,
//                               width: MediaQuery.of(context).size.width / 1.1,
//                               child: Stack(
//                                 children: [
//                                   SizedBox(
//                                     height: MediaQuery.of(context).size.height /
//                                         4.1,
//                                     width:
//                                         MediaQuery.of(context).size.width / 1.1,
//                                     child: Image.asset(
//                                       "assets/pride.png",
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width:
//                                         MediaQuery.of(context).size.width / 1.1,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceEvenly,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 1.3,
//                                             child: TextWidget(
//                                               "      Taking Pride in Our Peruvian Heritage",
//                                               false,
//                                               textScale: 1.3,
//                                               textColor: Colors.white,
//                                               fontWeight: FontWeight.w600,
//                                               textAlign: TextAlign.center,
//                                             )),
//                                         SizedBox(
//                                             width: MediaQuery.of(context)
//                                                     .size
//                                                     .width /
//                                                 1.3,
//                                             child: TextWidget(
//                                               "        We started 12 years ago with one goal in mind – bringing authentic Peruvian cuisine to North America! We prepare every meal with added richness ",
//                                               false,
//                                               textScale: 0.9                                                                                                                                                                                                                                                                                                                                                       ,
//                                               textColor: Colors.white,
//                                               fontWeight: FontWeight.w600,
//                                             )),
//                                         SizedBox(height: 5,),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.only(left: 10, right: 10),
//                               child: Row(
//                                 children: [
//                                   TextWidget(
//                                    "Work Rooster",      false,
//                                     textScale: 1.8,
//                                     textColor: Colors.black,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//
//                                   const Spacer(),
//
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: ListView.builder(
//                                 shrinkWrap: true,
//                                 physics: const NeverScrollableScrollPhysics(),
//                                 scrollDirection: Axis.vertical,
//                                 itemCount: 4,
//                                 itemBuilder: (BuildContext context,
//                                         int index) =>
//                                     index.isEven
//                                         ? Container(
//                                       height: MediaQuery.of(context).size.height / 4.4,
//                                       width: MediaQuery.of(context).size.width / 1.1,
//                                       child: Stack(
//                                         children: [
//                                           Align(
//                                             child: Container(
//                                               height:
//                                               MediaQuery.of(context).size.height / 4.8,
//                                               width: MediaQuery.of(context).size.width / 1.1,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Colors.grey.withOpacity(0.2),
//                                                     spreadRadius: 5,
//                                                     blurRadius: 7,
//                                                     offset: Offset(
//                                                         3, 3), // changes position of shadow
//                                                   ),
//                                                 ],
//                                               ),
//                                               child: Row(
//                                                 children: [
//                                                   const Spacer(),
//                                                   SizedBox(
//                                                     width:
//                                                     MediaQuery.of(context).size.width / 2,
//                                                     child: Column(
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                       children: [
//                                                         const SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         TextWidget(
//                                                           "S&L Diner",
//                                                           false,
//                                                           textAlign: TextAlign.left,
//                                                           fontWeight: FontWeight.w900,
//                                                           textColor: Colors.black,
//                                                           textScale: 1.2,
//                                                         ),
//                                                         const SizedBox(
//                                                           height: 10,
//                                                         ),
//                                                         TextWidget(
//                                                           "Classic Peruvian dish...apa o Cassava a Ia Huancaina.",
//                                                           false,
//                                                           textAlign: TextAlign.left,
//                                                           fontWeight: FontWeight.w600,
//                                                           textColor: Colors.black,
//                                                           textScale: 1,
//                                                         ),
//                                                         const Spacer(),
//                                                         Padding(
//                                                           padding: const EdgeInsets.only(
//                                                               bottom: 8),
//                                                           child: Align(
//                                                             alignment: Alignment.bottomRight,
//                                                             child: InkWell(
//                                                               onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsRecipes())),
//                                                               child: Container(
//                                                                 width: MediaQuery.of(context)
//                                                                     .size
//                                                                     .width /
//                                                                     4.5,
//                                                                 height: 30,
//                                                                 decoration: const BoxDecoration(
//                                                                   borderRadius:
//                                                                   BorderRadius.only(
//                                                                     topLeft:
//                                                                     Radius.circular(3.0),
//                                                                     bottomLeft:
//                                                                     Radius.circular(3.0),
//                                                                   ),
//                                                                   color: Colors.black,
//                                                                 ),
//                                                                 child: const Center(
//                                                                     child: Text('View More',
//                                                                         style: TextStyle(
//                                                                             fontWeight:
//                                                                             FontWeight
//                                                                                 .bold,
//                                                                             color: Colors
//                                                                                 .white))),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             alignment: Alignment.bottomCenter,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Align(
//                                               child: Container(
//                                                 height: 140,
//                                                 decoration: const BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                                 child: Image.asset(
//                                                   "assets/dinner.png",
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                               alignment: Alignment.topLeft,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                         : Container(
//                                       height: MediaQuery.of(context).size.height / 4.4,
//                                       width: MediaQuery.of(context).size.width / 1.1,
//                                       child: Stack(
//                                         children: [
//                                           Align(
//                                             child: Container(
//                                               height:
//                                               MediaQuery.of(context).size.height / 4.8,
//                                               width: MediaQuery.of(context).size.width / 1.1,
//                                               decoration: BoxDecoration(
//                                                 color: Colors.white,
//                                                 boxShadow: [
//                                                   BoxShadow(
//                                                     color: Colors.grey.withOpacity(0.2),
//                                                     spreadRadius: 5,
//                                                     blurRadius: 7,
//                                                     offset: const Offset(
//                                                         3, 3), // changes position of shadow
//                                                   ),
//                                                 ],
//                                               ),
//                                               child: Row(
//                                                 children: [
//                                                   SizedBox(
//                                                     width:
//                                                     MediaQuery.of(context).size.width / 2,
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.all(8.0),
//                                                       child: Column(
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment.start,
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment.start,
//                                                         children: [
//                                                           const SizedBox(
//                                                             height: 10,
//                                                           ),
//                                                           TextWidget(
//                                                             "S&L Diner",
//                                                             false,
//                                                             textAlign: TextAlign.left,
//                                                             fontWeight: FontWeight.w900,
//                                                             textColor: Colors.black,
//                                                             textScale: 1.2,
//                                                           ),
//                                                           const SizedBox(
//                                                             height: 10,
//                                                           ),
//                                                           TextWidget(
//                                                             "Classic Peruvian dish...apa o Cassava ",
//                                                             false,
//                                                             textAlign: TextAlign.left,
//                                                             fontWeight: FontWeight.w600,
//                                                             textColor: Colors.black,
//                                                             textScale: 1,
//                                                           ),
//                                                           const Spacer(),
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(
//                                                                 bottom: 8, left: 0),
//                                                             child: Align(
//                                                               alignment: Alignment.bottomLeft,
//                                                               child: InkWell(
//                                                                 onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DetailsRecipes())),
//                                                                 child: Container(
//                                                                   width: MediaQuery.of(context)
//                                                                       .size
//                                                                       .width /
//                                                                       4.5,
//                                                                   height: 25,
//                                                                   decoration:
//                                                                   const BoxDecoration(
//                                                                     borderRadius:
//                                                                     BorderRadius.only(
//                                                                       topRight:
//                                                                       Radius.circular(4.0),
//                                                                       bottomRight:
//                                                                       Radius.circular(4.0),
//                                                                     ),
//                                                                     color: Colors.black,
//                                                                   ),
//                                                                   child: const Center(
//                                                                       child: Text(
//                                                                           'View More',
//                                                                           style: TextStyle(
//                                                                               fontWeight:
//                                                                               FontWeight
//                                                                                   .bold,
//                                                                               color: Colors
//                                                                                   .white))),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Spacer(),
//                                                 ],
//                                               ),
//                                             ),
//                                             alignment: Alignment.bottomCenter,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Align(
//                                               child: Container(
//                                                 height: 140,
//                                                 decoration: const BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                 ),
//                                                 child: Image.asset(
//                                                   "assets/dinner.png",
//                                                   fit: BoxFit.fill,
//                                                 ),
//                                               ),
//                                               alignment: Alignment.topRight,
//                                             ),
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                     childCount: 1,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schef/drawer/bottomscreen.dart';

class Checklist extends StatefulWidget {
  const Checklist({Key? key}) : super(key: key);

  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State<Checklist> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  var checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        drawer: DrawerScreen(context),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/main_logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 85.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 390,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:  [
                            const SizedBox(height: 20,),
                            SizedBox(


                              width: MediaQuery.of(context).size.width/1.4,
                              child: const Center(child: Text("Check list", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textScaleFactor: 1.5,)),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                              width: MediaQuery.of(context).size.width/1.4,
                              child: TextFormField(

                                decoration: const InputDecoration(


                                  labelText: "Full Name",
                                  labelStyle: TextStyle(
                                      color:Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'pnregular'
                                  ),

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:Colors.grey,
                                    ),
                                  ),
                                  focusedBorder:UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.grey,
                                        width: 2.0),

                                  ),
                                  fillColor: Colors.white,


                                ),

                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    color:Colors.grey,
                                    fontFamily: 'pnregular',
                                    fontSize: 17
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                              width: MediaQuery.of(context).size.width/1.4,
                              child: TextFormField(

                                decoration: const InputDecoration(
                                 labelText: "Task",
                                  labelStyle: TextStyle(
                                      color:Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'pnregular'
                                  ),

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:Colors.grey,
                                    ),
                                  ),
                                  focusedBorder:UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.grey,
                                        width: 2.0),

                                  ),
                                  fillColor: Colors.white,


                                ),
                                // validator: (val) {
                                //   if(val.length==0) {
                                //     return "Email cannot be empty";
                                //   }else{
                                //     return null;
                                //   }
                                // },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    color:Colors.grey,
                                    fontFamily: 'pnregular',
                                    fontSize: 17
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                              width: MediaQuery.of(context).size.width/1.4,
                              child: TextFormField(

                                decoration: const InputDecoration(


                                  labelText: "Date",
                                  labelStyle: TextStyle(
                                      color:Colors.grey,
                                      fontSize: 16,
                                      fontFamily: 'pnregular'
                                  ),

                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:Colors.grey,
                                    ),
                                  ),
                                  focusedBorder:UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color:Colors.grey,
                                        width: 2.0),

                                  ),
                                  fillColor: Colors.white,


                                ),
                                // validator: (val) {
                                //   if(val.length==0) {
                                //     return "Email cannot be empty";
                                //   }else{
                                //     return null;
                                //   }
                                // },
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                    color:Colors.grey,
                                    fontFamily: 'pnregular',
                                    fontSize: 17
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black),
                                  color: Colors.black

                              ),
                              width: MediaQuery.of(context).size.width/1.4,
                              child: const Center(child: Text("Submit", style: TextStyle(color: Colors.white),)),
                            ),
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
            ],
          ),
        ),
      ),
    );
  }
}
