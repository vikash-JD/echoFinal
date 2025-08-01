import 'package:flutter/material.dart';
import '../themes/dark_theme.dart';
import '../widgets/app_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.pushReplacementNamed(context, '/login'),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://assets10.lottiefiles.com/packages/lf20_2LdLki.json', // New, more relevant hearing animation
                  height: 120,
                  repeat: true,
                ),
                const SizedBox(height: 24),
                Text(
                  'Welcome to ECHO',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: AppDarkTheme.headerText,
                    letterSpacing: 1.2,
                    shadows: [Shadow(color: AppDarkTheme.primary.withOpacity(0.3), blurRadius: 8)],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  'Tap anywhere to continue',
                  style: GoogleFonts.poppins(fontSize: 16, color: AppDarkTheme.bodyText.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 