

// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazon_clone/common/widget/appBars/bottom_bar.dart';
import 'package:amazon_clone/constants/error_handling.dart';
import 'package:amazon_clone/models/user.dart';
import 'package:amazon_clone/services/provider/user_provider.dart';
import 'package:amazon_clone/utils/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../constants/env.dart';
class AuthService {

  ///sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      /// user model
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        type: '',
        token: '',
      );
      http.Response res = await http.post(
          Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8",
          },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account created! Login with credentials");
          },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  ///sign IN user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
            "email": email,
            "password": password,
        }),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
        },
      );

      // ignore: use_build_context_synchronously
      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () async {
          /// shared preferences save data to memory
          SharedPreferences pref = await SharedPreferences.getInstance();

          ///provider
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);

          ///set data - token
          await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
          
          Navigator.pushNamedAndRemoveUntil(
              context, BottomBar.routeName,
                  (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  ///getting user data
   void getUserData(
    BuildContext context,
  ) async {
    try {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("x-auth-token");
    
    if (token == null){
      pref.setString("x-auth-token", '');
    }
    
    var tokenRes = await http.post(
        Uri.parse("$uri/tokenIsValid"),
        headers: <String, String> {
              'Content-Type': "application/json; charset=UTF-8",
              'x-auth=-token': token!
            },
    );
    var response = jsonDecode(tokenRes.body);

    if (response){
        http.Response userRes = await http.get(Uri.parse("$uri/"),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'x-auth=-token': token
        }
        );
        
        var userProvider = Provider.of<UserProvider>(context, listen:false );
        userProvider.setUser(userRes.body);
    }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
