import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/glass_card.dart';
import '../widgets/app_button.dart';
import '../themes/dark_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _sent = false;

  void _resetPassword() {
    setState(() {
      _sent = true;
    });
    // TODO: Integrate with backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Forgot Password', style: GoogleFonts.montserrat(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: GlassCard(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Reset your password', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 22, color: AppDarkTheme.headerText), textAlign: TextAlign.center),
                const SizedBox(height: 12),
                Text('Enter your email address and we’ll send you a link to reset your password.', style: GoogleFonts.poppins(fontSize: 15, color: AppDarkTheme.bodyText), textAlign: TextAlign.center),
                const SizedBox(height: 24),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                AppButton(
                  text: 'Reset Password',
                  onPressed: _resetPassword,
                ),
                if (_sent) ...[
                  const SizedBox(height: 18),
                  Text('A password reset link has been sent to your email.', style: GoogleFonts.poppins(color: AppDarkTheme.primary), textAlign: TextAlign.center),
                ],
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                  child: Text('Back to Login', style: GoogleFonts.poppins(color: AppDarkTheme.accent)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 