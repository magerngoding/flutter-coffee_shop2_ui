// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../models/coffee.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  String categorySelected = 'All Coffee';
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(
          0), // padding 0 menyesuaikan layar atas <-- contoh dokumentasi koding. Oalah macam ni
      children: [
        Stack(
          children: [
            buildBackground(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Gap(68),
                  buildHeader(),
                  Gap(30),
                  buildSearch(),
                  Gap(24),
                  buildBannerPromo(),
                ],
              ),
            )
          ],
        ),
        Gap(24),
        buildCategories(),
        Gap(16),
        buildGridCoffee(),
        Gap(30),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0XFF111111),
            Color(0XFF313131),
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Location",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Color(0XFFA2A2A2),
          ),
        ),
        Row(
          children: [
            Text(
              "West Java, Indonesia",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: Color(0XFFd8d8d8),
              ),
            ),
            Image.asset(
              'assets/ic_arrow_down.png',
              width: 14.0,
              height: 14.0,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 50.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
              color: Color(
                0XFF2A2A2A,
              ),
            ),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(
                    "assets/ic_search.png",
                  ),
                  color: Colors.white,
                ),
                Gap(8),
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Search coffee',
                      hintStyle: TextStyle(
                        color: Color(0XFFA2A2A2),
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Gap(16),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0XFFc67c4e),
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          width: 52,
          height: 52,
          child: ImageIcon(
            AssetImage(
              'assets/ic_filter.png',
            ),
            size: 20,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget buildBannerPromo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "assets/banner.png",
        width: double.infinity,
        height: 140.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildCategories() {
    final categories = [
      'All Coffee',
      'Machiato',
      'Latte',
      'Americano',
      'Cappucino',
    ];

    return SizedBox(
      height: 29,
      child: ListView.builder(
        physics: BouncingScrollPhysics(), // efek mantul
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          String category = categories[index];
          bool isActive = categorySelected == categories[index];
          return GestureDetector(
            onTap: () {
              categorySelected = category;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: index == 0 ? 24 : 8,
                right: index == categories.length - 1 ? 24 : 8,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isActive
                    ? Color(0XFFC67C4E)
                    : Color(0XFFEDED).withOpacity(0.35),
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              child: Text(
                category,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                  color: isActive ? Colors.white : Color(0XFF313131),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridCoffee() {
    return GridView.builder(
      itemCount: listGridCoffee.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // banyaknya data 2 kiri dan kanan
        mainAxisExtent: 238, // height container
        crossAxisSpacing: 15, // space kiri kanan
        mainAxisSpacing: 24, // space atas bawah
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 24),
      itemBuilder: (context, index) {
        Coffee coffee = listGridCoffee[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/detail',
              arguments: coffee,
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(
              8,
              8,
              8,
              12,
            ),
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        coffee.image,
                        width: double.infinity,
                        height: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0XFF111111).withOpacity(0.3),
                              Color(0XFF313131).withOpacity(0.3),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            bottomLeft: Radius.circular(24),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize
                                .min, // menyesuaikan dengan aligment top right
                            children: [
                              Image.asset(
                                "assets/ic_star_filled.png",
                                width: 12,
                                height: 12,
                              ),
                              Gap(4),
                              Text(
                                '${coffee.rate}', // string interpolation
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(8),
                Text(
                  coffee.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0XFF242424),
                  ),
                ),
                Gap(4),
                Text(
                  coffee.type,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFF242424),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      NumberFormat.currency(
                        // untuk format numbering dari INTL
                        decimalDigits: 2,
                        locale: 'en_US',
                        symbol: '\$',
                      ).format(coffee.price),
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF050505),
                      ),
                    ),
                    Container(
                      height: 32.0,
                      width: 32,
                      decoration: const BoxDecoration(
                        color: Color(0XFFC67E4E),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
