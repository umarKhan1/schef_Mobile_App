import 'package:flutter/material.dart';
import 'package:schef/drawer/bottomscreen.dart';

import 'managerdrawer/managerdrawer.dart';

class ManagerDashboard extends StatefulWidget {
  const ManagerDashboard({Key? key}) : super(key: key);

  @override
  _ManagerDashboardState createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  var checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        drawer: ManagerDrawer(context),
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 85.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 340,
                      width: 330,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Welcome Michal, To Manager Dashboard",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              textScaleFactor:1.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.justify,
                              textScaleFactor: 1.0,
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
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () => _scaffoldState.currentState!.openDrawer(),
                      child:  Image.asset("assets/main_logo.png",height: 30,width: 30,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
