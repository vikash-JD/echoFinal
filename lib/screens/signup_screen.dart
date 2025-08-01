import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_button.dart';
import '../widgets/glass_card.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: AppDarkTheme.accent),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    Text('Sign Up', style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 32),
                GlassCard(
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _nameController,
                        label: 'Name',
                        icon: Icons.person,
                        glass: true,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your name' : null,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _emailController,
                        label: 'Email',
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        glass: true,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: _passwordController,
                        label: 'Password',
                        icon: Icons.lock,
                        obscureText: true,
                        glass: true,
                        validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: _agreed,
                            onChanged: (v) => setState(() => _agreed = v ?? false),
                            activeColor: AppDarkTheme.primary,
                            checkColor: AppDarkTheme.headerText,
                          ),
                          const Expanded(
                            child: Text('I agree to the healthcare Terms of Service and Privacy Policy',
                              style: TextStyle(color: AppDarkTheme.bodyText, fontSize: 13)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      AppButton(
                        text: 'Sign Up',
                        onPressed: _agreed ? () {} : null,
                        glass: false,
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ", style: TextStyle(color: AppDarkTheme.bodyText)),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Text('Sign in', style: TextStyle(color: AppDarkTheme.accent, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ],
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