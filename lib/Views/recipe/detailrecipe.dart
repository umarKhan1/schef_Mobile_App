import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schef/API/global.dart';

import 'package:schef/widgets/text/text_widget.dart';
import '../../constant.dart';

class DetailsRecipes extends StatefulWidget {

  var name;
  var image;
  var excerpt;
  var procedure;


  DetailsRecipes({this.name, this.image, this.excerpt,this.procedure});

  @override
  _DetailsRecipesState createState() => _DetailsRecipesState();


}

class _DetailsRecipesState extends State<DetailsRecipes>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool _value = false;
  int _value1 = 1;
  bool _visible = false;
  var addtocart;
  String? ordername;

  var checkBoxValue1 = false;
  var checkBoxValue2 = false;
  var checkBoxValue3 = false;
  var checkBoxValue4 = false;

  var price = 180;

  var counter = 1;
  int? product;

  void _incrementCount() {
    setState(() {
      counter++;
    });
  }

  void _decrementCount() {
    setState(() => counter--);
  }

  void _resetCount() {
    setState(() => counter = 0);
  }

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 2, vsync: this);
    print(widget.image);
    print(widget.name);
    print(widget.excerpt);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.APP_WHITE_COLOR,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 370,
                      width: double.infinity,
                      decoration:  BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.image.toString()),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, right: 20, left: 35),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                color: Constants.APP_WHITE_COLOR,
                                size: 30,
                              )),
                          const Spacer(),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 299, right: 20, left: 35),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        // height: 20,
                        // width: MediaQuery.of(context).size.width/1.8,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                widget.name.toString(),
                                false,
                                textScale: 1.8,
                                fontWeight: FontWeight.w500,
                                textColor: Colors.black,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                widget.excerpt.toString(),
                                false,
                                textScale: 1.0,
                                fontWeight: FontWeight.w500,
                                textColor: Colors.black,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 433),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        height: 50,
                        child: TabBar(
                          labelPadding: EdgeInsets.only(left: 10),
                          unselectedLabelColor: Colors.black,
                          labelColor: Constants.APP_BACKGROUND_COLOR,
                          indicatorColor: Constants.APP_BLUR_COLOR,
                          indicatorPadding: EdgeInsets.only(
                            left: 55,
                            right: 45,
                          ),
                          tabs: const [
                            Tab(
                              text: "Ingredients",
                            ),
                            Tab(
                              text: 'Procedure',
                            ),
                          ],
                          controller: _tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 485),
                      child: Container(
                        // width: MediaQuery.of(context).size.width/1.1,
                        height: MediaQuery.of(context).size.height / 1.27,

                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            // first tab bar view widget
                            Container(
                              height: 10,
                              child: ListView.builder(
                                  itemCount: Allingrediantslist.length,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, index) {
                                    return Column(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 304,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 22,
                                                offset: const Offset(0,
                                                    7), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 36,
                                                  width: 36,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      // color: Constants.
                                                      borderRadius:
                                                          BorderRadius.circular(9)),
                                                  child: Center(
                                                      child: Image.asset(
                                                    "assets/notepad.png",
                                                    height: 25,
                                                    width: 25,
                                                  )),
                                                ),
                                                TextWidget(
                                                  Allingrediantslist[index].name,
                                                  false,
                                                  textScale: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                  textColor: Colors.black,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    const SizedBox(
                                    height: 10,),
                                      ],
                                    );
                                  }),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: SizedBox(
                                height: 107,
                                width: 329,
                                child: Column(
                                  children:  [
                                    SizedBox(height: 30,),
                                   // Text(widget.excerpt.toString()),
                                    Text(widget.procedure.toString(), textAlign: TextAlign.justify,),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
