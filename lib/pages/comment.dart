// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/component/appbar.dart';
import 'package:task1/component/checkbox.dart';
import 'package:task1/component/comment.dart';
import 'package:task1/component/outlineBorder.dart';
import 'package:task1/const/asset.dart';
import 'package:task1/const/color.dart';

class CommentScreen extends StatefulWidget {
  String username;
  CommentScreen({super.key, this.username = "نام کاربری"});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          AppBarComponent(
            appBar: AppBar(
              toolbarHeight: 90,
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              actions: [
                Row(
                  children: [
                    Text(
                      widget.username,
                      style: TextStyle(color: white),
                    ),
                    IconButton(
                        alignment: Alignment.bottomCenter,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset(Assets.backicon)),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              "نظری دارید؟",
              style: TextStyle(color: black, fontSize: 18),
            ),
          ),
          Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Container(
                  height: 50,
                  color: lightgrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                child: TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "نظر من اینکه برای ...",
                      border: OutlineInputBorder(borderSide: BorderSide(color: mediumgrey))),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(0),
            color: lightgrey,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [CheckBox(), outlineBorder()],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "آخرین نظرات کاربران",
                    style: TextStyle(color: mediumgrey),
                  ),
                ),
                Comment(),
                Comment(),
                Comment()
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            gradient: LinearGradient(colors: const [Color(0xff9434E8), Color(0xff4B63EA)])),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          elevation: 0,
          enableFeedback: false,
          showUnselectedLabels: false,
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
