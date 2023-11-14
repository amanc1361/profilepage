// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task1/const/asset.dart';
import 'package:task1/pages/page1.dart';
import 'package:task1/pages/page2.dart';
import 'package:task1/pages/page3.dart';
import 'package:task1/pages/page4.dart';
import 'package:task1/pages/profile.dart';
import 'package:task1/pages/question.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List pages = [
    ProfilePage(),
    QuestionScreen(),
    Page2(),
    Page3(),
    Page4(),
  ];
  void changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            gradient: LinearGradient(colors: const [Color(0xff9434E8), Color(0xff4B63EA)])),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          onTap: changePage,
          showSelectedLabels: false,
          elevation: 0,
          enableFeedback: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  Assets.profileicon,
                  color: Colors.white,
                ),
                icon: Image.asset(
                  Assets.profileicon,
                  color: Colors.grey.shade300,
                )),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Assets.ringicon,
                  color: Colors.white,
                ),
                label: "",
                icon: Image.asset(
                  Assets.ringicon,
                  color: Colors.grey.shade300,
                )),
            BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  Assets.dateicon,
                  color: Colors.white,
                ),
                icon: Image.asset(
                  Assets.backpackicon,
                  color: Colors.grey.shade300,
                )),
            BottomNavigationBarItem(
                label: "",
                activeIcon: Image.asset(
                  Assets.tent3icon,
                  color: Colors.white,
                ),
                icon: Image.asset(
                  Assets.tent3icon,
                  color: Colors.grey.shade300,
                )),
            BottomNavigationBarItem(
                activeIcon: Image.asset(
                  Assets.leticon,
                  color: Colors.white,
                ),
                label: "",
                icon: Image.asset(
                  Assets.leticon,
                  color: Colors.grey.shade300,
                )),
          ],
        ),
      ),
    );
  }
}
