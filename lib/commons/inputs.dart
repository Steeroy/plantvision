// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputBox extends StatelessWidget {
  final String placeholderText;
  final String type;

  const InputBox({
    Key? key,
    required this.placeholderText,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: TextField(
        obscureText: type == 'text' ? false : true,
        style: GoogleFonts.roboto(
            textStyle: const TextStyle(
                color: Color(0xFF363636),
                fontSize: 18,
                fontWeight: FontWeight.normal,
                letterSpacing: 1.0)),
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            hintText: placeholderText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: Color(0xFF23E02A), width: 3)),
            fillColor: const Color(0xFFF4F4F4),
            filled: true,
            focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(4))),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.roboto(
          textStyle: const TextStyle(
              color: Color(0xFF363636),
              fontSize: 18,
              fontWeight: FontWeight.normal,
              letterSpacing: 1.0)),
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        filled: true,
        fillColor: const Color(0xffF5F6FA),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
