import 'package:flutter/material.dart';
import 'package:schef/Introslider/introscreen.dart';
import 'package:schef/Views/checklist.dart';
import 'package:schef/Views/home.dart';
import 'package:schef/Views/recipe/recipesscreen.dart';
import 'package:schef/Views/roster/rosterscreen.dart';
import 'package:schef/Views/updateprofiles/profilescreen.dart';
import 'package:schef/contactform.dart';
import 'package:schef/managerviews/CheckList/check_list_view.dart';
import 'package:schef/managerviews/RecipesList/recipe_view.dart';
import 'package:schef/managerviews/Resturant/resturtantview.dart';

import '../homescreen.dart';

Widget ManagerDrawer(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.6,
    child: Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text("Micheal John"),
            accountEmail: Text("John@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  ManagerDashboard()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant),
            title: const Text("Restaurant"),
            onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ResturtantView()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.checklist),
            title: const Text("Check List"),
            onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const CheckListView()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.fastfood),
            title: const Text("Recipes"),
            onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const RecipeView()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Contact Us"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ContactForm()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const IntroScreen()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
    ),
  );
}
