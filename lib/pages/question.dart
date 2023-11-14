// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/component/appbar.dart';
import 'package:task1/component/button.dart';
import 'package:task1/component/cardmessage.dart';
import 'package:task1/component/checkbox.dart';
import 'package:task1/component/comment.dart';
import 'package:task1/const/asset.dart';
import 'package:task1/const/color.dart';
import 'package:task1/model/question.dart';

class QuestionScreen extends StatefulWidget {
  Question? question;
  Color? bodycolor;
  String username;
  QuestionScreen({super.key, this.question, this.bodycolor, this.username = ""});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  TextEditingController _textEditingController = TextEditingController();
  sendQuestion() {
    if (_textEditingController.text.length < 5) return;
    Question().answer(answer: _textEditingController.text, questionid: widget.question!.id!).then((value) {
      Get.back();
    });
  }

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
            child: CardMessage(
              title: widget.question!.question!,
              bodyColor: widget.bodycolor!,
              countresponse: 0,
            ),
            bottom: -50,
          ),
          SizedBox(
            height: 70,
          ),
          Text(
            "پاسخی برای این سوال دارید؟",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
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
                  controller: _textEditingController,
                  maxLines: 3,
                  decoration: InputDecoration(
                      hintText: "نظر من اینکه برای ...",
                      border: OutlineInputBorder(borderSide: BorderSide(color: mediumgrey))),
                ),
              ),
            ],
          ),
          Container(
            color: lightgrey,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckBox(),
                    ButtonWidget(
                      onTap: sendQuestion,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    "آخرین پاسخ های کاربران",
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
