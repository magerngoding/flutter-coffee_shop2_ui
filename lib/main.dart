// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop_ui/models/coffee.dart';
import 'package:coffee_shop_ui/pages/dashboard_page.dart';
import 'package:coffee_shop_ui/pages/detail_page.dart';
import 'package:coffee_shop_ui/pages/onboard_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.soraTextTheme(),
        scaffoldBackgroundColor: Color(0XFFF9F9F9),
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoradPage(),
      routes: {
        '/dashboard': (context) => DashboardPage(),
        '/detail': (context) {
          Coffee coffee = ModalRoute.of(context)!.settings.arguments as Coffee;
          return DetailPage(coffee: coffee);
        },
      },
    );
  }
}
