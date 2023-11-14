// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:task1/const/color.dart';

class CardMessage extends StatelessWidget {
  String title;
  int countresponse;
  Color bodyColor;
  CardMessage({this.title = "", this.countresponse = 0, this.bodyColor = cornflowerBlue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: white),
          ),
          Text(
            countresponse.toString() + "پاسخ",
            style: TextStyle(color: white),
          ),
        ],
      ),
      height: 120,
      width: MediaQuery.of(context).size.width / 2,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: bodyColor),
    );
  }
}
