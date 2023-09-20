// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:first_project/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFEFEFE)),
            elevation: MaterialStateProperty.all(0),
            textStyle: MaterialStateProperty.all(const TextStyle(
                color: Color(0xFF30B135),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w500)),
            minimumSize: MaterialStateProperty.all(const Size(154, 48)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 24)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Color(0xFFFEFEFE), width: 2)))),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF30B135),
          ),
        ));
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF30B135)),
            elevation: MaterialStateProperty.all(0),
            textStyle: MaterialStateProperty.all(const TextStyle(
                color: Color(0xFFFEFEFE),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w500)),
            minimumSize: MaterialStateProperty.all(const Size(154, 48)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 24)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Color(0xFFFEFEFE), width: 2)))),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}

class ThirdButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ThirdButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFFFEFEFE)),
            elevation: MaterialStateProperty.all(0),
            textStyle: MaterialStateProperty.all(const TextStyle(
                color: Color(0xFFFEFEFE),
                fontFamily: 'Montserrat',
                fontSize: 16,
                fontWeight: FontWeight.w500)),
            minimumSize: MaterialStateProperty.all(const Size(154, 48)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 24)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Color(0xFFFEFEFE), width: 2)))),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ));
  }
}

class BigPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BigPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 192, 213, 226),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFEFEFE),
          ),
          elevation: MaterialStateProperty.all<double>(
            0,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: GlobalVariables.backgroundColor,
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class BigSecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const BigSecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFFEFEFE),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 192, 213, 226),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                GlobalVariables.backgroundColor),
            elevation: MaterialStateProperty.all<double>(
              0,
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFFFEFEFE),
            fontFamily: 'Montserrat',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
