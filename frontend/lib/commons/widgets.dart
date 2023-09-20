import 'package:first_project/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: GlobalVariables.backgroundColor,
      toolbarHeight: 68,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 32,
            height: 36,
          ),
          const SizedBox(width: 8),
          const Text(
            'PlantVision',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 18,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
