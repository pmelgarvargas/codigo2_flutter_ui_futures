
import 'package:codigo2_ui_future/pages/detail_page.dart';
import 'package:codigo2_ui_future/pages/home_page.dart';
import 'package:codigo2_ui_future/pages/init_page.dart';
import 'package:codigo2_ui_future/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: "UI - Future",
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: InitPage(),
    );
  }
}





