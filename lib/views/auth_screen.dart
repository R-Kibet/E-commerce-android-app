import 'package:amazon_clone/common/widget/custom_button.dart';
import 'package:amazon_clone/common/widget/custom_textfield.dart';
import 'package:amazon_clone/constants/global.dart';
import 'package:amazon_clone/enums/actions.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    key: _signUpKey,
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

                            })
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
