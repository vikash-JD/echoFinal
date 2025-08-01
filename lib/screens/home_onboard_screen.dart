import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../themes/dark_theme.dart';
import '../widgets/app_button.dart';

class HomeOnboardScreen extends StatefulWidget {
  const HomeOnboardScreen({Key? key}) : super(key: key);

  @override
  State<HomeOnboardScreen> createState() => _HomeOnboardScreenState();
}

class _HomeOnboardScreenState extends State<HomeOnboardScreen> {
  bool _showMain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: !_showMain
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://assets10.lottiefiles.com/packages/lf20_2LdLki.json', // Modern 3D/interactive style
                        height: 220,
                        repeat: true,
                      ),
                      const SizedBox(height: 32),
                      AppButton(
                        text: 'Start',
                        onPressed: () => setState(() => _showMain = true),
                        icon: Icons.arrow_forward,
                        glass: false,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_9cyyl8i4.json',
                        height: 180,
                        repeat: true,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppDarkTheme.primary,
                            foregroundColor: AppDarkTheme.headerText,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Login', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 16)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pushReplacementNamed(context, '/signup'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppDarkTheme.accent,
                            side: const BorderSide(color: AppDarkTheme.accent),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Sign Up', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 16)),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
} 