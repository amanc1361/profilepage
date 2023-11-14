// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:task1/const/color.dart';

class Activites extends StatelessWidget {
  String count;
  String title;
  Activites({super.key, this.count = "", this.title = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(0, 0),
          blurRadius: 25,
          spreadRadius: 0,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            count.toPersianDigit(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(color: mediumgrey),
          )
        ],
      ),
    );
  }
}
