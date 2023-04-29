import 'package:flutter/material.dart';

class DocumentationScreen extends StatelessWidget {
  const DocumentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Documentation Page',
        style: TextStyle(
          color: Colors.black54,
          fontFamily: 'Montserrat',
          fontSize: 32,
        ),
      ),
    );
  }
}
