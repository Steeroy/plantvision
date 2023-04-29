// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          color: Color.fromARGB(255, 59, 68, 60),
          fontWeight: FontWeight.w500,
          letterSpacing: 1),
    );
  }
}

class BigText extends StatelessWidget {
  final String text;

  const BigText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 32,
          color: Color(0xFFFEFEFE),
          fontWeight: FontWeight.w600,
          letterSpacing: 3),
    );
  }
}
