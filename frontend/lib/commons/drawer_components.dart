import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/global_variables.dart';
import '../providers/user_provider.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      color: GlobalVariables.backgroundColor,
      width: double.infinity,
      height: 240,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 48,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'))),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            user.name,
            style: const TextStyle(
                color: Color.fromARGB(255, 242, 245, 242),
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            user.role,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 242, 245, 242),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.0)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            user.email,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 242, 245, 242),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.0)),
          ),
        ],
      ),
    );
  }
}
