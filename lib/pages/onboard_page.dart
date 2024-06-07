// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:coffee_shop_ui/widgets/button_primare_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnBoradPage extends StatelessWidget {
  const OnBoradPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/bg.png",
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color(0XFF050505),
                    Color(0XFF050505),
                    Color(0XFF050505),
                    Color(0XFF050505),
                  ],
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(40),
                  Text(
                    "Fail in Love with\nCoffee in Blissful\n Delight!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                  Gap(8),
                  Text(
                    "Wellcome to our cozy coffee corner, where\n every cup is a delightful for you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                      color: Color(0XFFA2A2A2),
                    ),
                  ),
                  Gap(30),
                  ButtonPrimaryWidget(
                    title: 'Get Statred',
                    onTap: () {
                      Navigator.pushNamed(context,
                          '/dashboard'); // pembungkush fragment home buat naro bottom navbar
                    },
                  ),
                  Gap(40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
