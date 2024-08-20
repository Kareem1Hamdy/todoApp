import 'package:flutter/material.dart';
import 'package:todo_app/home/primary_screen.dart';
import 'package:todo_app/home/settings_screen.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;

  List<Widget> screenList=[
    PrimaryScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.all(10),
        notchMargin: 25,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (current){
            setState(() {
              currentIndex=current;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
          ],
        )
      ),
      body: screenList[currentIndex],

    );
  }
}
