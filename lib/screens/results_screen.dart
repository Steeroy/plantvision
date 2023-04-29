import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Results Page',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Montserrat',
          fontSize: 32,
        ),
      ),
    );
  }
}
