// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/const/color.dart';
import 'package:task1/model/user.dart';
import 'package:task1/pages/verifycode.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _txtphoneController = TextEditingController();
  String err = "";
  void checkin() {
    if (_txtphoneController.text.length < 9) return;
    setState(() {
      err = "";
    });
    User().checkin(_txtphoneController.text.trim()).then((value) {
      Get.to(VerifyScreen());
      ;
    }).catchError((onError) {
      setState(() {
        err = onError.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _txtphoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: mediumgrey)),
                  label: Text("شماره موبایل خود را وارد نمایید ")),
            ),
            Text(
              err,
              style: TextStyle(color: orange),
            ),
            TextButton(
                onPressed: () {
                  checkin();
                },
                child: Text(
                  "ورود",
                  style: TextStyle(color: orange, fontWeight: FontWeight.bold, fontSize: 18),
                ))
          ],
        ),
      ),
    );
  }
}
