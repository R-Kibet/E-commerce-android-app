import 'package:amazon_clone/common/widget/appBars/bottom_bar.dart';
import 'package:amazon_clone/views/admin/add_product_screen.dart';
import 'package:amazon_clone/views/auth_screen.dart';
import 'package:flutter/material.dart';

import '../views/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch(routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
          builder: (_) => const AuthScreen()
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen()
      );
    case BottomBar.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const BottomBar()
      );
    case AddProductScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const AddProductScreen()
      );
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("page doesn't exist"),
            ),
          )
      );
      
  }
}