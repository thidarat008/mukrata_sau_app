// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukrata_sau_app/views/about_ui.dart';
import 'package:mukrata_sau_app/views/calculate_pay_bill_ui.dart';
import 'package:mukrata_sau_app/views/menu_shop_ui.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  List<Widget> _currenshow = [
    CalculatePayBillUI(),
    MenuShopUI(),
    AboutUI(),
  ];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 144, 84, 67),
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: ConvexAppBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        initialActiveIndex: _currentIndex,
        backgroundColor: Color.fromARGB(255, 148, 121, 102),
        items: [
          TabItem(
            icon: Icon(
              FontAwesomeIcons.moneyBill,
              color: Color.fromARGB(255, 1, 3, 128),
            ),
            title: 'คิดเงิน',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.home,
              color: Color.fromARGB(255, 103, 1, 1),
            ),
            title: 'Home',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.star,
              color: Color.fromARGB(255, 206, 186, 8),
            ),
            title: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: _currenshow[_currentIndex],
    );
  }
}
