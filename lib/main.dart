
import 'package:amazon_clone/common/widget/appBars/bottom_bar.dart';
import 'package:amazon_clone/constants/global.dart';
import 'package:amazon_clone/constants/route.dart';
import 'package:amazon_clone/services/auth/auth_service.dart';
import 'package:amazon_clone/services/provider/user_provider.dart';
import 'package:amazon_clone/views/admin/admin_screen.dart';
import 'package:amazon_clone/views/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => UserProvider(),
    ),
  ],
      child: const MaterialApp (home: MyApp()),
  )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final AuthService authService = AuthService();

  @override
  void initState() {
    authService.getUserData(context);
    super.initState();
  }

  // This widget is the root of your  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
              primary: GlobalVariables.secondaryColor,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                  color: Colors.black),
            )
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider
            .of<UserProvider>(context)
            .user
            .token
            .isNotEmpty
            ? Provider
            .of<UserProvider>(context)
            .user.type == "user"
            ? const BottomBar()
            : const AdminScreen()
            : const AuthScreen()
    );
  }
}
