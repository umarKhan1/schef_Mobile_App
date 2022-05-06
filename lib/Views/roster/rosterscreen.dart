import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:schef/drawer/bottomscreen.dart';
class RosterScreen extends StatefulWidget {
  const RosterScreen({Key? key}) : super(key: key);

  @override
  _RosterScreenState createState() => _RosterScreenState();
}

class _RosterScreenState extends State<RosterScreen> with TickerProviderStateMixin  {
   int? _selectedIndex ;

  PageController? _pageController;

  final search = TextEditingController();

  TabController? tabController;
  //List of Cards with size
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  final List<StaggeredTile>  _cardTile = <StaggeredTile> [
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
    StaggeredTile.count(2, 3),
    StaggeredTile.count(2, 2),
  ];
   void _onItemTapped(int index) {
     setState(() {
       _selectedIndex= index;
       _pageController!.animateToPage(index,
           duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
     });
   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(initialIndex:  0, length: 5, vsync: this);
    _pageController = PageController();
  }
   @override
   void dispose() {
     _pageController!.dispose();

   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
drawer: DrawerScreen(context),
        body: SafeArea(
          child: SingleChildScrollView(

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
                    onFieldSubmitted: (val)async{
                      print("adasdasdasdasd");
                    },
                    validator:  (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Something';
                      }
                      return null;
                    },
                    controller: search,
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
          // CalendarTimeline(
          //   initialDate: DateTime(2020, 4, 20),
          //   firstDate: DateTime(2019, 1, 15),
          //   lastDate: DateTime(2020, 11, 20),
          //   onDateSelected: (date) => print(date),
          //   leftMargin: 20,
          //   monthColor: Colors.black,
          //   dayColor: Colors.black,
          //   activeDayColor: Colors.white,
          //   activeBackgroundDayColor: Colors.black,
          //   dotsColor: Color(0xFF333A47),
          //   selectableDayPredicate: (date) => date.day != 23,
          //   locale: 'en_ISO',
          // ),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
        InkWell(
          onTap: (){
            _onItemTapped(0);
          },
          child: Container(height: 50,

    width: 100,



      decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),

          color:_selectedIndex == 0? Colors.grey.withOpacity(0.5): Colors.black,

      ),

      child: const Center(child: Text("Month", style: TextStyle(color: Colors.white), textScaleFactor: 1.2,)),

    ),
        ),
    InkWell(
      onTap: ()
      {
        _onItemTapped(1);

      }
      ,

      child: Container(height: 50,

        width: 100,



        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),

          color: _selectedIndex == 1? Colors.grey.withOpacity(0.5): Colors.black,

        ),

        child: const Center(child: Text("Day", style: TextStyle(color: Colors.white), textScaleFactor: 1.2,)),

      ),
    ),
    InkWell(
      onTap: (){
        _onItemTapped(2);
      },
      child: Container(height: 50,

        width: 100,



        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(10),

          color:_selectedIndex == 2? Colors.grey.withOpacity(0.5): Colors.black,

        ),

        child: const Center(child: Text("Year", style: TextStyle(color: Colors.white), textScaleFactor: 1.2,)),

      ),
    ),
  ],
),
          const SizedBox(height: 20,),
      Container(
        height: 570,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            SizedBox(height: 570,
                child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 12,
                    itemCount: 25,
                    scrollDirection: Axis.vertical,

                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15))
                          ),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                              Text("Lorem ipsum dolor sit amet, consectetur", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),

                                SizedBox(height: 20),
                                Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                                SizedBox(height: 20),
                                Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                                SizedBox(height: 20),
                                Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                            ],),
                          ),

                        ),
                      );
                    },

                    staggeredTileBuilder: (index) {
                      return StaggeredTile.count(1, index.isEven ? 1.3: 1.4);
                    }),
            ),
            SizedBox(height: 570,
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 12,
                  itemCount: 25,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15))
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Lorem ipsum dolor sit amet, consectetur", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),

                              SizedBox(height: 20),
                              Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                              SizedBox(height: 20),
                              Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                              SizedBox(height: 20),
                              Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                            ],),
                        ),

                      ),
                    );
                  },

                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.3: 1.4);
                  }),
            ),
            SizedBox(height: 570,
              child: StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 12,
                  itemCount: 25,
                  scrollDirection: Axis.vertical,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(
                                Radius.circular(15))
                        ),

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Lorem ipsum dolor sit amet, consectetur", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),

                              SizedBox(height: 20),
                              Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                              SizedBox(height: 20),
                              Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                              SizedBox(height: 20),
                              Text("• Lorem ipsum", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ), textScaleFactor: 1.1,),
                            ],),
                        ),

                      ),
                    );
                  },

                  staggeredTileBuilder: (index) {
                    return StaggeredTile.count(1, index.isEven ? 1.3: 1.4);
                  }),
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
