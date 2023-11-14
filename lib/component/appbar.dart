// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task1/component/avatae.dart';
import 'package:task1/const/color.dart';

class AppBarComponent extends StatefulWidget {
  AppBar appBar;
  Widget? child;
  double? bottom;
  AppBarComponent({super.key, required this.appBar, this.child, this.bottom = 0});

  @override
  State<AppBarComponent> createState() => _AppBarComponentState();
}

class _AppBarComponentState extends State<AppBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: 160,
          child: widget.appBar,
          decoration: BoxDecoration(
              color: white,
              image: DecorationImage(image: AssetImage("assets/image/appbackground.png"), fit: BoxFit.cover)),
        ),
        Positioned(bottom: widget.bottom, left: 75, right: 75, child: widget.child ?? Container())
      ],
    );
  }
}
