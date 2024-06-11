// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

import 'package:coffee_shop_ui/models/coffee.dart';
import 'package:gap/gap.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatefulWidget {
  final Coffee coffee;

  const DetailPage({
    Key? key,
    required this.coffee,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Gap(68),
          buildHeader(),
          Gap(24),
          buildImage(),
          Gap(24),
          buildMainInfo(),
          Gap(24),
          buildDescription(),
          Gap(24),
          //  buildSize(),
          Gap(24),
        ],
      ),
      // bottomNavigationBar: //buildPrice(),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ImageIcon(
            AssetImage(
              'assets/ic_arrow_left.png',
            ),
          ),
        ),
        Text(
          "Detail",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFF242424),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ImageIcon(
            AssetImage(
              'assets/ic_heart_border.png',
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
      child: Image.asset(
        widget.coffee.image,
        width: double.infinity,
        height: 202.0,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildMainInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          widget.coffee.name,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFF242424),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(4),
                Text(
                  widget.coffee.type,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFFA2A2A2),
                  ),
                ),
                Gap(16),
                Row(
                  children: [
                    Image.asset(
                      "assets/ic_star_filled.png",
                      width: 20.0,
                      height: 20.0,
                    ),
                    Gap(4),
                    Text(
                      '${widget.coffee.rate}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF242424),
                      ),
                    ),
                    Text(
                      ' (${widget.coffee.review})',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        color: Color(0XFFA2A2A2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                'assets/bike.png',
                'assets/bean.png',
                'assets/milk.png'
              ].map((e) {
                return Container(
                  margin: const EdgeInsets.only(left: 12),
                  alignment: Alignment.center,
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                    color: Color(0XFFEDEDED).withOpacity(0.35),
                  ),
                  child: Image.asset(
                    e,
                    width: 24.0,
                    height: 24.0,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
        Gap(16),
        Divider(
          indent: 16,
          endIndent: 16,
          color: Color(0XFFE3E3E3),
          height: 1,
          thickness: 1,
        )
      ],
    );
  }

  Widget buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFF242424),
          ),
        ),
        Gap(8),
        ReadMoreText(
          trimLength: 110,
          trimMode: TrimMode.Length,
          widget.coffee.description,
          trimCollapsedText: ' Read More',
          trimExpandedText: ' Read Less',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: Color(0XFFA2A2A2),
          ),
          moreStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Color(0XFFC67C4E),
          ),
          lessStyle: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w300,
            color: Color(0XFFC67C4E),
          ),
        ),
      ],
    );
  }
}
