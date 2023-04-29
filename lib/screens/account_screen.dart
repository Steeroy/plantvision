import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Account Page',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Montserrat',
          fontSize: 32,
        ),
      ),
    );
  }
}
