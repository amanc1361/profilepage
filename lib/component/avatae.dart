// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AvatarProfile extends StatefulWidget {
  const AvatarProfile({super.key});

  @override
  State<AvatarProfile> createState() => _AvatarProfileState();
}

class _AvatarProfileState extends State<AvatarProfile> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: Arc(),
        size: Size(MediaQuery.of(context).size.width, 160),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            child: Image.network(
                fit: BoxFit.fill,
                width: 120,
                height: 120,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRB-r-33_9ZqU1sAITY2wlJNXYt-qkzsLszA&usqp=CAU"),
          ),
          // backgroundImage: NetworkImage(
          //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRB-r-33_9ZqU1sAITY2wlJNXYt-qkzsLszA&usqp=CAU",
          // ),
        ));
  }
}

class Arc extends CustomPainter {
  double _degreeToRadians(num degree) {
    return (degree * 3.141516) / 180.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height - 60), radius: 60);
    double startAngle = _degreeToRadians(-90);
    double sweepAngle = _degreeToRadians(270);
    const useCenter = false;
    Paint paint = Paint();
    paint.color = Color(0xffF69631);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
