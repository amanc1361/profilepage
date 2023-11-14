// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task1/const/color.dart';

class CheckBox extends StatefulWidget {
  Color backcolor;
  String title;

  CheckBox({super.key, this.title = "به صورت ناشناس", this.backcolor = cornflowerBlue});

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 2),
          width: 50,
          height: 27,
          decoration: BoxDecoration(color: widget.backcolor, borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(shape: BoxShape.circle, color: white),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(widget.title)
      ],
    );
  }
}
