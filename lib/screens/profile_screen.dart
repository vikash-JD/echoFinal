import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppDarkTheme.primary.withOpacity(0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: const CircleAvatar(
                  radius: 44,
                  backgroundColor: AppDarkTheme.primary,
                  child: Icon(Icons.person, color: Colors.white, size: 44),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(child: Text('Olivia', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText))),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ProfileStat(icon: Icons.hearing, label: 'Good', value: 'Hearing Health'),
                _ProfileStat(icon: Icons.graphic_eq, label: '40 dB', value: 'Threshold'),
                _ProfileStat(icon: Icons.insert_drive_file, label: '2', value: 'Reports'),
              ],
            ),
            const SizedBox(height: 32),
            Text('Test History', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
            const SizedBox(height: 16),
            GlassCard(
              child: ListTile(
                leading: const Icon(Icons.timeline, color: AppDarkTheme.accent),
                title: Text('General report: Mild', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                subtitle: Text('Jul 10, 2023', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
              ),
            ),
            const SizedBox(height: 12),
            GlassCard(
              child: ListTile(
                leading: const Icon(Icons.timeline, color: AppDarkTheme.accent),
                title: Text('General report: Good', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                subtitle: Text('Jul 5, 2023', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
              ),
            ),
            const SizedBox(height: 32),
            GlassCard(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.favorite, color: AppDarkTheme.accent),
                    title: Text('My Saved', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today, color: AppDarkTheme.accent),
                    title: Text('Appointment', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.question_answer, color: AppDarkTheme.accent),
                    title: Text('FAQs', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: AppDarkTheme.accent),
                    title: Text('Logout', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _ProfileStat({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Icon(icon, color: AppDarkTheme.accent, size: 28),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, color: AppDarkTheme.bodyText)),
          Text(value, style: const TextStyle(fontSize: 12, color: AppDarkTheme.bodyText)),
        ],
      ),
    );
  }
} 