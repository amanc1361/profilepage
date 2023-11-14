import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task1/const/asset.dart';
import 'package:task1/model/user.dart';
import 'package:task1/pages/homepage.dart';
import 'package:task1/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void route() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      final box = GetStorage();
      User().id = box.read("id") ?? "";
      User().token = box.read("token") ?? "";
      if (User().id!.isNotEmpty && User().token!.isNotEmpty) {
        Get.to(HomePage());
      } else {
        Get.to(LoginScreen());
      }
    });
  }

  @override
  void initState() {
    route();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            Assets.logoicon,
            height: 100,
            width: 175,
          ))
        ],
      ),
    );
  }
}
