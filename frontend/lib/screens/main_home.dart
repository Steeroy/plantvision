// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:convert';

import 'package:first_project/commons/buttons.dart';
import 'package:first_project/commons/texts.dart';
import 'package:first_project/constants/global_variables.dart';
import 'package:first_project/screens/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  String imagePath = "";
  final picker = ImagePicker();
  final TextEditingController plantSectionController = TextEditingController();

  Future uploadImage(File file) async {
    final url = Uri.parse("${GlobalVariables.uri}/predict");

    final request = http.MultipartRequest('POST', url);

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        file.path,
      ),
    );

    try {
      final response = await request.send();

      // Check if the request was successful (HTTP status code 200)
      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> responseMap = json.decode(responseBody);
        final String status = responseMap['class'];

        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(
              imagePath: imagePath,
              status: status,
            ),
          ),
        );
        print(responseMap['class']);
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              imagePath != ""
                  ? SizedBox(
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
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const LabelText(
                      text: "Plant Section",
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              BigPrimaryButton(
                text: "Choose Image",
                onPressed: () async {
                  final pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    setState(() {
                      imagePath = pickedFile.path;
                    });
                  }
                },
              ),
              imagePath != ""
                  ? const SizedBox(
                      width: double.infinity,
                      height: 18,
                    )
                  : const SizedBox(),
              imagePath != ""
                  ? BigSecondaryButton(
                      text: "Predict Fruit/Veg Health",
                      onPressed: () {
                        uploadImage(File(imagePath));
                      },
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
