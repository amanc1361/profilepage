// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:task1/component/activites.dart';
import 'package:task1/component/appbar.dart';
import 'package:task1/component/avatae.dart';
import 'package:task1/component/cardmessage.dart';
import 'package:task1/component/comment.dart';
import 'package:task1/component/link.dart';
import 'package:task1/const/asset.dart';
import 'package:task1/const/color.dart';
import 'package:task1/model/question.dart';
import 'package:task1/model/user.dart';
import 'package:task1/pages/comment.dart';
import 'package:task1/pages/question.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Question> questions = [];
  getquesions() {
    Question().get(User().id!).then((value) {
      setState(() {
        questions = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getquesions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            AppBarComponent(
              appBar: AppBar(
                toolbarHeight: 90,
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: IconButton(onPressed: () {}, icon: Image.asset(Assets.settingicon)),
                actions: [
                  IconButton(alignment: Alignment.bottomCenter, onPressed: () {}, icon: Image.asset(Assets.backicon))
                ],
              ),
              child: AvatarProfile(),
              bottom: -15,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "عباس بوعذار",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "بازیکن فوتبال",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Activites(
                    count: "163",
                    title: "ستاره ها",
                  ),
                  Activites(
                    count: "87",
                    title: "فعالیت ها",
                  ),
                  Activites(
                    count: "209",
                    title: "دوستان",
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Link(
                  title: "ّبیوگرافی",
                ),
                Link(
                  title: "تماس با ما",
                  isactive: true,
                ),
                Link(
                  title: "فعالیت ها",
                ),
                Link(
                  title: "امتیازات",
                ),
              ],
            ),
            Container(
              width: double.infinity,
              color: lightgrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemcard(
                      title: "تلفن:",
                      item: "09147256898".toPersianDigit(),
                      icon: Assets.phoneicon,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    itemcard(
                      title: "ایمیل:",
                      item: "rahymrm@gmail.com",
                      fontcolor: darkgrey,
                      icon: Assets.emailicon,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "شبکه های اجتماعی:",
                        style: TextStyle(color: mediumgrey),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          Assets.instaicon,
                          height: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          Assets.twitericon,
                          height: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          Assets.linkinicon,
                          height: 32,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Image.asset(
                          Assets.facebookicon,
                          height: 32,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "سوالات",
                        style: TextStyle(color: mediumgrey),
                      ),
                    ),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                          itemCount: questions.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(QuestionScreen(
                                  question: questions[index],
                                  bodycolor: index % 2 == 0 ? cornflowerBlue : orange,
                                  username: "نام کاربری",
                                ));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardMessage(
                                  title: questions[index].question!,
                                  bodyColor: index % 2 == 0 ? cornflowerBlue : orange,
                                  countresponse: 0,
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("نظرات:"),
                        IconButton(
                            onPressed: () {
                              Get.to(CommentScreen());
                            },
                            icon: Image.asset(Assets.addicon))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Comment(),
            Comment()
          ],
        ),
      ),
    );
  }
}

class itemcard extends StatelessWidget {
  String title;
  String item;
  String icon;
  Color fontcolor;
  itemcard({this.title = "", this.item = "", this.icon = "", this.fontcolor = mediumgrey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: mediumgrey, fontSize: 16),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          item,
          style: TextStyle(
            color: fontcolor,
            fontSize: 18,
          ),
        ),
        Spacer(),
        Image.asset(
          icon,
          height: 32,
        )
      ],
    );
  }
}
