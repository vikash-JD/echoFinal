import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../services/firebase_auth_service.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_button.dart';
import '../widgets/glass_card.dart';
import '../widgets/animated_page_route.dart';
import '../themes/dark_theme.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _error;
  bool _obscure = true;
  bool _showForm = false;
  final FirebaseAuthService _authService = FirebaseAuthService();

  void _login() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final user = await _authService.signIn(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (user != null) {
        Navigator.of(context).pushReplacementNamed('/main');
      }
    } catch (e) {
      setState(() { _error = e.toString().replaceFirst('Exception: ', ''); });
    } finally {
      setState(() { _isLoading = false; });
    }
  }

  void _goToSignup() {
    Navigator.of(context).push(AnimatedPageRoute(child: SignupScreen(), type: PageTransitionType.slide));
  }

  void _goToForgotPassword() {
    Navigator.of(context).push(AnimatedPageRoute(child: ForgotPasswordScreen(), type: PageTransitionType.slide));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppDarkTheme.headerText,
                          letterSpacing: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      GlassCard(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AppTextField(
                              controller: _emailController,
                              label: 'Email',
                              icon: Icons.email,
                              keyboardType: TextInputType.emailAddress,
                              glass: true,
                              validator: (value) => value == null || value.isEmpty ? 'Please enter your email' : null,
                            ),
                            const SizedBox(height: 18),
                            AppTextField(
                              controller: _passwordController,
                              label: 'Password',
                              icon: Icons.lock,
                              obscureText: _obscure,
                              glass: true,
                              validator: (value) => value == null || value.isEmpty ? 'Please enter your password' : null,
                            ),
                            const SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: _goToForgotPassword,
                                child: const Text('Forgot password?', style: TextStyle(color: AppDarkTheme.accent, fontWeight: FontWeight.w600)),
                              ),
                            ),
                            const SizedBox(height: 18),
                            if (_error != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  _error!,
                                  style: const TextStyle(color: Colors.red),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            AppButton(
                              text: 'Login',
                              onPressed: _isLoading ? null : _login,
                              loading: _isLoading,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account? ", style: TextStyle(color: AppDarkTheme.bodyText)),
                                GestureDetector(
                                  onTap: _goToSignup,
                                  child: Text('Sign up', style: TextStyle(color: AppDarkTheme.accent, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
} 