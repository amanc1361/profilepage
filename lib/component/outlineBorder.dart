import 'package:flutter/material.dart';
import 'package:task1/const/color.dart';

class outlineBorder extends StatefulWidget {
  const outlineBorder({super.key});

  @override
  State<outlineBorder> createState() => _outlineBorderState();
}

class _outlineBorderState extends State<outlineBorder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), border: Border.all(color: cornflowerBlue)),
      child: Text("ارسال"),
    );
  }
}
