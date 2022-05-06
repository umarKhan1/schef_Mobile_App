import 'package:flutter/material.dart';
import 'package:schef/Views/checklist.dart';
import 'package:schef/Views/home.dart';
import 'package:schef/Views/recipe/recipesscreen.dart';
import 'package:schef/Views/roster/rosterscreen.dart';
import 'package:schef/Views/updateprofiles/profilescreen.dart';

Widget DrawerScreen(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.6,
    child: Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  home()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text("Work Roster"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const RosterScreen()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.local_dining_outlined),
            title: const Text("Dinner Recipes"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const RecipeScreen()));
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
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Checklist()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("My Profile"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>  Profile()));
            },
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.withOpacity(0.1),
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),
  );
}