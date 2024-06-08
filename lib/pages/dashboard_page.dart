// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'dashboard_fragments/home_fragment.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int indexMenu = 0;
  final menu = [
    {
      'icon': 'assets/ic_home_border.png',
      'icon_active': 'assets/ic_home_filled.png',
      'fragment': const HomeFragment(),
    },
    {
      'icon': 'assets/ic_heart_border.png',
      'icon_active': 'assets/ic_heart_border.png',
      'fragment': const Center(child: Text('Favorite')),
    },
    {
      'icon': 'assets/ic_bag_border.png',
      'icon_active': 'assets/ic_bag_border.png',
      'fragment': const Center(child: Text('Bag')),
    },
    {
      'icon': 'assets/ic_notification_border.png',
      'icon_active': 'assets/ic_notification_border.png',
      'fragment': const Center(child: Text('Notification')),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: List.generate(
            menu.length,
            (index) {
              Map item = menu[index];
              bool isActive =
                  indexMenu == index; // indexMenu adalah index sekarag
              return Expanded(
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 70,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gap(20),
                        ImageIcon(
                          AssetImage(
                            item[isActive ? 'icon_active' : 'icon'],
                          ),
                          size: 24,
                          color: Color(isActive ? 0XFFC67C4E : 0XFFA2A2A2),
                        ),
                        if (isActive) Gap(6),
                        if (isActive)
                          Container(
                            height: 5,
                            width: 10,
                            decoration: BoxDecoration(
                              color: Color(0XFFC67C4E),
                              borderRadius: BorderRadius.all(
                                Radius.circular(18.0),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
