import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';
import 'quiz_screen.dart';

class ModeSelectScreen extends StatelessWidget {
  const ModeSelectScreen({Key? key}) : super(key: key);

  void _goToQuiz(BuildContext context, String mode) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QuizScreen(mode: mode)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Select Mode', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _goToQuiz(context, 'clinic'),
              child: GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Row(
                  children: [
                    Icon(Icons.local_hospital, color: AppDarkTheme.primary, size: 40),
                    const SizedBox(width: 24),
                    Text('Clinic Mode', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () => _goToQuiz(context, 'game'),
              child: GlassCard(
                padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                child: Row(
                  children: [
                    Icon(Icons.sports_esports, color: AppDarkTheme.accent, size: 40),
                    const SizedBox(width: 24),
                    Text('Game Mode', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 