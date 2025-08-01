import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// Navigation & Auth Flow
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/forgot_password_screen.dart';
import 'screens/splash_screen.dart';
// Main App UI
import 'screens/home_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/home_onboard_screen.dart';
import 'screens/mode_select_screen.dart';
import 'screens/lisa_chat_screen.dart';
import 'themes/dark_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EchoApp());
}

class EchoApp extends StatelessWidget {
  const EchoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ECHO Hearing Health',
      theme: AppDarkTheme.dark,
      darkTheme: AppDarkTheme.dark,
      themeMode: ThemeMode.dark,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        // Navigation & Auth Flow
        '/onboarding': (_) => const OnboardingScreen(),
        '/home_onboard': (_) => const HomeOnboardScreen(),
        '/login': (_) => const LoginScreen(),
        '/signup': (_) => const SignupScreen(),
        '/forgot-password': (_) => const ForgotPasswordScreen(),
        // Main App UI (protected)
        '/main': (_) => const MainAppNavigator(),
        '/lisa': (_) => const LisaChatScreen(),
        '/mode_select': (_) => const ModeSelectScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// MainAppNavigator: Bottom navigation for Home, Reports, Notifications, Profile
class MainAppNavigator extends StatefulWidget {
  const MainAppNavigator({Key? key}) : super(key: key);
  @override
  State<MainAppNavigator> createState() => _MainAppNavigatorState();
}

class _MainAppNavigatorState extends State<MainAppNavigator> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomeScreen(),
    ReportsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        backgroundColor: AppDarkTheme.base,
        selectedItemColor: AppDarkTheme.primary,
        unselectedItemColor: AppDarkTheme.bodyText.withOpacity(0.7),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
// TODO: Add route guards for /main (require authentication)

