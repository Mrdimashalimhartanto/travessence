import 'package:flutter/material.dart';
import 'package:travessence/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashPage(),
        "/welcome-page": (context) => const WelcomePage(),
        "/main-page": (context) => const MainPage(),
        "/cart-page": (context) => const CartPage(),
      },
    );
  }
}
