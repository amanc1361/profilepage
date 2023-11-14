import 'package:flutter/material.dart';
import 'package:task1/const/color.dart';

class ButtonWidget extends StatefulWidget {
  String title;
  final VoidCallback? onTap;
  ButtonWidget({super.key, this.title = "ارسال پاسخ", this.onTap});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), gradient: LinearGradient(colors: [lightpurple, darkpurple])),
        child: Text(
          "ارسال پاسخ",
          style: TextStyle(color: white),
        ),
      ),
    );
  }
}
