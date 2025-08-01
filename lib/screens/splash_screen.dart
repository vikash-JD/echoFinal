import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe3f0ff), Color(0xFFb6d0f7)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://assets10.lottiefiles.com/packages/lf20_5ngs2ksb.json',
              height: 120,
              width: 120,
              fit: BoxFit.contain,
              repeat: true,
            ),
            const SizedBox(height: 32),
            const Text('ECHO', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent, letterSpacing: 2)),
          ],
        ),
      ),
    );
  }
} 