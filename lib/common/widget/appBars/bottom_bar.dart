import 'package:amazon_clone/constants/global.dart';
import 'package:amazon_clone/views/profile_screen.dart';
import 'package:flutter/material.dart' hide Badge;
import 'package:badges/badges.dart';

import '../../../views/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  static const routeName = "/actual-home";

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBorderWidth = 5;

  ///function move the bar cursor to the pages
  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
    const Center(child: Text("cart")
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,

        onTap: updatePage,
        items: [

          /// HOME PAGE
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: _page == 0
                      ? GlobalVariables.selectedNavBarColor
                      : GlobalVariables.backgroundColor,
                  width: bottomBarBorderWidth,
                )
              )
            ),
            child: const Icon(
              Icons.home_outlined,
            ),
          ),
            label: "",
          ),

          /// ACCOUNT / PROFILE
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: _page == 1
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    )
                )
            ),
            child: const Icon(
              Icons.person_outline_outlined,
            ),
          ),
            label: "",
          ),

          /// CART
          BottomNavigationBarItem(icon: Container(
            width: bottomBarWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                      color: _page == 2
                          ? GlobalVariables.selectedNavBarColor
                          : GlobalVariables.backgroundColor,
                      width: bottomBarBorderWidth,
                    )
                )
            ),
            child: const Badge(
              badgeContent: Text('2'),
              badgeStyle: BadgeStyle(
                badgeColor: Colors.blue
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
              ),
            ),
          ),
            label: "",
          )
        ],
      ),
    );
  }
}
