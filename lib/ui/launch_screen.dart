import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding section/welcome_back.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  bool isInitialImage = true;

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  bool changingImage() {
    setState(() {
      isInitialImage = false;
    });
    return isInitialImage;
  }

  initialAction() async {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const WelcomeBackPage(),
            )));
    Timer(const Duration(seconds: 3), () => changingImage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: SizedBox(
            height: 250,
            width: 250,
            child: isInitialImage
                ? Image.asset('assets/images/Carbon-logo.webp')
                : Image.asset('assets/images/carbon_long_logo.png')),
      ),
    );
  }
}
