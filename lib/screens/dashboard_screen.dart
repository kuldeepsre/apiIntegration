import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/screens/photoscreen.dart';
import 'package:quoteapi/screens/quotes_screen.dart';
import '../provider/dashboard_provider.dart';
import 'Profile.dart';
import 'SettingsScreen.dart';



class DashboardScreen extends StatelessWidget {

  final List<Widget> pages = [
    PhotoScreen(),
    QuotesScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<DashboardProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),

      drawer: Drawer(
        child: ListView(
          children: [

            DrawerHeader(
              child: Text("Menu"),
            ),

            ListTile(
              title: Text("Home"),
              onTap: (){
                provider.changeIndex(0);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Profile"),
              onTap: (){
                provider.changeIndex(1);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text("Settings"),
              onTap: (){
                provider.changeIndex(2);
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),

      body:IndexedStack(
        index: provider.selectedIndex,
        children: pages,
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.selectedIndex,
        onTap: (index){
          provider.changeIndex(index);
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.deepPurpleAccent,
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),

        ],
      ),

    );
  }
}