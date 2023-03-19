import 'package:amazon_clone/common/widget/custom%20/custom_button.dart';
import 'package:amazon_clone/common/widget/custom%20/custom_textfield.dart';
import 'package:amazon_clone/constants/global.dart';
import 'package:amazon_clone/enums/actions.dart';
import 'package:amazon_clone/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  static const routeName = '/auth_screen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signUp;

  final _signUpKey = GlobalKey<FormState>();
  final _signInKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ///binding sign up user with ui
  final AuthService authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signUpUser(){
    authService.signUpUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('welcome',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              ),
              ListTile(
                ///section color
                tileColor:
                _auth == Auth.signUp ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                title: const Text('Create account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signUp,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signUp)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _nameController,
                          hintText: "Name",
                        ),
                        const SizedBox(height: 10,),

                        CustomTextField(
                            controller: _emailController,
                            hintText: "Email",
                        ),
                        const SizedBox(height: 10,),

                        CustomTextField(
                          controller: _passwordController,
                          hintText: "password",
                        ),

                        const SizedBox(height: 10),
                        CustomButton(
                            text: "Sign Up",
                            onTap: () {
                              if (_signUpKey.currentState!.validate()){
                                signUpUser();
                              }

                            })
                      ],

                    ),
                  ),
                ),
              ListTile(
                tileColor:
                _auth == Auth.signIn ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundCOlor,
                title: const Text(' sign in',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signIn,
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signIn)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signInKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: "Email",
                        ),
                        const SizedBox(height: 10,),

                        CustomTextField(
                          controller: _passwordController,
                          hintText: "password",
                        ),

                        const SizedBox(height: 10),
                        CustomButton(
                            text: "Sign In",
                            onTap: () {
                              if (_signInKey.currentState!.validate()){
                              signInUser();
                              }
                            }),
                      ],

                    ),
                  ),
                ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
