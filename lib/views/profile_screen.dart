import 'package:amazon_clone/common/widget/buttons/top_button.dart';
import 'package:amazon_clone/common/widget/orders.dart';
import 'package:amazon_clone/constants/global.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15
              ),
              child: Row(
                children: const [
                  Padding(padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: Icon(Icons.notifications_outlined),
                  ),
                  Icon(Icons.search),
                ],
              ),
            )
          ],
          ),
        ),
      ),
      body: Column(
        children: const [
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 15),
          Orders(),
        ],
      )
    );
  }
}
