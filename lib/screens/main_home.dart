import 'package:flutter/material.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Home Page',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Montserrat',
          fontSize: 32,
        ),
      ),
    );
  }
}
