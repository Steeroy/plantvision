import 'package:first_project/screens/signup_screen.dart';
import 'package:first_project/services/auth_services.dart';
import 'package:flutter/material.dart';

import '../commons/buttons.dart';
import '../commons/inputs.dart';
import '../commons/texts.dart';
import '../constants/global_variables.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void loginUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
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
                const BigText(text: 'Log In'),
                const SizedBox(height: 38),
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
                const SizedBox(height: 18),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Forgot password? ',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF476348))),
                  TextSpan(
                      text: 'Recover here',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF476348)))
                ])),
                const SizedBox(height: 42),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryButton(
                      text: 'Log In',
                      onPressed: loginUser,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SecondaryButton(
                      text: 'Register',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
