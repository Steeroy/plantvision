import 'package:first_project/providers/user_provider.dart';
import 'package:first_project/screens/home_screen.dart';
import 'package:first_project/screens/signup_screen.dart';
import 'package:first_project/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: const MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const SignUpScreen()
          : const HomeScreen(),
    );
  }
}
