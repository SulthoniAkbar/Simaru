import 'dart:async';

import 'package:flutter/material.dart';

import '../themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/sign-in'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor1,
        body: Center(
          child: Container(
            width: 260,
            height: 66,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/splashscreen.png',
                ),
              ),
            ),
          ),
        ));
  }
}
