// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task1/const/asset.dart';
import 'package:task1/const/color.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    String title =
        "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است";

    return Container(
      color: lightgrey,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.network(
                  fit: BoxFit.fill,
                  width: 40,
                  height: 40,
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRB-r-33_9ZqU1sAITY2wlJNXYt-qkzsLszA&usqp=CAU"),
            ),
            // backgroundImage: NetworkImage(
            //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRB-r-33_9ZqU1sAITY2wlJNXYt-qkzsLszA&usqp=CAU",
            // ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "مهدی طارمی",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "2 روز پیش",
                      style: TextStyle(color: mediumgrey),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Image.asset(Assets.hearticon),
          ),
        ],
      ),
    );
  }
}
