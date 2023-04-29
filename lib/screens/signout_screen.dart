import 'package:flutter/material.dart';

class SignOutScreen extends StatelessWidget {
  const SignOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Signout Page',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Montserrat',
          fontSize: 32,
        ),
      ),
    );
  }
}
