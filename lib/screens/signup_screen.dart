import 'package:first_project/screens/signin_screen.dart';
import 'package:first_project/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../commons/buttons.dart';
import '../commons/inputs.dart';
import '../commons/texts.dart';
import '../constants/global_variables.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final AuthService authService = AuthService();

  void signupUser() {
    authService.signUpUser(
        context: context,
        email: emailController.text,
        name: nameController.text,
        password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariables.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: GlobalVariables.backgroundColor,
          toolbarHeight: 68,
          elevation: 0,
          title: Container(
            margin: const EdgeInsets.only(
              left: 4,
              top: 8,
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 32,
                  height: 36,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'PlantVision',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 72),
                const BigText(text: 'Register'),
                const SizedBox(height: 38),
                const LabelText(
                  text: 'Name',
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  child: CustomTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 16),
                const LabelText(
                  text: 'Email',
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  child: CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                  ),
                ),
                const SizedBox(height: 16),
                const LabelText(
                  text: 'Password',
                ),
                const SizedBox(height: 8),
                Container(
                  height: 48,
                  child: CustomTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: 'Register',
                      onPressed: signupUser,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SecondaryButton(
                        text: 'Log In ',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen()));
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
