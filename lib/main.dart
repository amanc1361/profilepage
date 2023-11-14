import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/const/color.dart';
import 'package:task1/pages/homepage.dart';
import 'package:task1/pages/login.dart';
import 'package:task1/pages/splash.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Radin Studio',
      locale: Locale('fa', "IR"),
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        fontFamily: GoogleFonts.vazirmatn().fontFamily,
        colorScheme: ColorScheme.fromSeed(seedColor: mediumgrey),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
