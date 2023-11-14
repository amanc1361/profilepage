import 'package:flutter/material.dart';

class Link extends StatefulWidget {
  String title;
  bool isactive;
  Link({super.key, this.title = "", this.isactive = false});

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          border: widget.isactive ? Border(bottom: BorderSide(color: Color(0xff5536ff), width: 3)) : Border()),
      child: Text(
        widget.title,
        style: TextStyle(fontSize: 14, color: widget.isactive ? Colors.black : Colors.grey.shade500),
      ),
    );
  }
}
