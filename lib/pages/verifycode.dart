import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task1/const/color.dart';
import 'package:task1/model/user.dart';
import 'package:task1/pages/homepage.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  TextEditingController _txtcodeController = TextEditingController();
  String err = "";
  void login() {
    setState(() {
      err = "";
    });
    User().login(User().id.toString(), _txtcodeController.text).then((value) {
      Get.replace(HomePage());
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
              controller: _txtcodeController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: mediumgrey)),
                  label: Text("کد ارسالی را وارد نمایید")),
            ),
            Text(
              err,
              style: TextStyle(color: orange),
            ),
            TextButton(
                onPressed: () {
                  login();
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
