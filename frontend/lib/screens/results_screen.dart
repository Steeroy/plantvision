import 'dart:io';

import 'package:first_project/commons/texts.dart';
import 'package:first_project/constants/global_variables.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String imagePath;
  final String status;

  const ResultsScreen({
    super.key,
    required this.imagePath,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    print('Status: ${status}');
    print('image path: ${imagePath}');
    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 268,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 18,
              ),
              Text(
                "Status: $status",
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    color: Color.fromARGB(255, 59, 68, 60),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
