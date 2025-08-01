import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Notifications', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          GlassCard(
            child: ListTile(
              leading: const Icon(Icons.notifications, color: AppDarkTheme.accent),
              title: Text('Your hearing test report is ready!', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
              subtitle: Text('Today, 10:00 AM', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
            ),
          ),
          const SizedBox(height: 12),
          GlassCard(
            child: ListTile(
              leading: const Icon(Icons.notifications, color: AppDarkTheme.accent),
              title: Text('Appointment confirmed with Dr. Rishi', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
              subtitle: Text('Yesterday, 3:00 PM', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
            ),
          ),
          const SizedBox(height: 12),
          GlassCard(
            child: ListTile(
              leading: const Icon(Icons.notifications, color: AppDarkTheme.accent),
              title: Text("Don't forget your hearing checkup tomorrow!", style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
              subtitle: Text('2 days ago', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
            ),
          ),
        ],
      ),
    );
  }
} 