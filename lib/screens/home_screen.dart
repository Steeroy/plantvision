import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../commons/drawer_components.dart';
import '../constants/global_variables.dart';
import '../services/auth_services.dart';

import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

import 'account_screen.dart';
import 'documentation_screen.dart';
import 'main_home.dart';
import 'results_screen.dart';
import 'signout_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  var currentPage = DrawerSection.home;

  @override
  Widget build(BuildContext context) {
    var container;

    if (currentPage == DrawerSection.home) {
      container = const MainHomeScreen();
    } else if (currentPage == DrawerSection.account) {
      container = const AccountScreen();
    } else if (currentPage == DrawerSection.results) {
      container = const ResultsScreen();
    } else if (currentPage == DrawerSection.documentation) {
      container = const DocumentationScreen();
    } else if (currentPage == DrawerSection.signout) {
      container = const SignOutScreen();
    }

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
      body: container,
      endDrawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              MyDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          menuItems(
              1,
              "Home",
              const Iconify(Mdi.home, size: 24, color: Colors.black87),
              currentPage == DrawerSection.home ? true : false),
          menuItems(
              2,
              "Account",
              const Iconify(Mdi.account, size: 24, color: Colors.black87),
              currentPage == DrawerSection.account ? true : false),
          menuItems(
              3,
              "Results",
              const Iconify(Mdi.chart_areaspline_variant,
                  size: 24, color: Colors.black87),
              currentPage == DrawerSection.results ? true : false),
          menuItems(
              4,
              "Documentation",
              const Iconify(Mdi.file_document, size: 24, color: Colors.black87),
              currentPage == DrawerSection.documentation ? true : false),
          menuItems(
              5,
              "Sign Out",
              const Iconify(Mdi.account_remove,
                  size: 24, color: Colors.black87),
              currentPage == DrawerSection.signout ? true : false),
        ],
      ),
    );
  }

  Widget menuItems(int id, String title, Iconify icon, bool selected) {
    return Material(
      color: selected ? GlobalVariables.backgroundColor : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSection.home;
            } else if (id == 2) {
              currentPage = DrawerSection.account;
            } else if (id == 3) {
              currentPage = DrawerSection.results;
            } else if (id == 4) {
              currentPage = DrawerSection.documentation;
            } else if (id == 5) {
              currentPage = DrawerSection.signout;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: icon,
              ),
              Expanded(
                  flex: 4,
                  child: Text(
                    title,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSection { home, account, results, documentation, signout }
