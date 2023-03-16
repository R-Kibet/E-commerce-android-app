import 'package:flutter/material.dart';

import '../../constants/global.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

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
    const Center(
      child: Text("Posts pages"),
    ),
    const Center(
      child: Text("Analytic pages"),
    ),
    const Center(
        child: Text("cart")
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          ///use this  properties for linear gradient
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          /// design appbar
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset("assets/images/amazon_in.png",
                    width: 100,
                    height: 45,
                    color: Colors.black,
                  )
              ),
              const Text (
                "admin",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              )

            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unselectedNavBarColor,
        backgroundColor: GlobalVariables.backgroundColor,
        iconSize: 28,

        onTap: updatePage,
        items: [

          /// POSTS
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

          /// ANALYTIC
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
              Icons.analytics_outlined,
            ),
          ),
            label: "",
          ),

          /// ORDERS
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
            child: const Icon(
              Icons.all_inbox_outlined,
            ),
          ),
            label: "",
          ),

        ],
      ),
    );
  }
}
