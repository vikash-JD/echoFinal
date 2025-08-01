import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';

class DoctorDetailScreen extends StatelessWidget {
  const DoctorDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Doctor Detail', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: ListView(
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
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: Text('Dr. Rishi', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText, fontSize: 20)),
          ),
          Center(
            child: Text('ENT / Otolaryngologist', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText, fontSize: 14)),
          ),
          Center(
            child: Text('800m away', style: GoogleFonts.poppins(color: AppDarkTheme.accent, fontSize: 13)),
          ),
          const SizedBox(height: 24),
          GlassCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText, fontSize: 16)),
                const SizedBox(height: 8),
                Text(
                  'Dr. Rishi Verma is a highly experienced ENT specialist with over 10 years of expertise in diagnosing and treating hearing loss.',
                  style: GoogleFonts.poppins(color: AppDarkTheme.bodyText, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Select Date', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText, fontSize: 15)),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _DateChip(label: '21', selected: false),
                _DateChip(label: '22', selected: false),
                _DateChip(label: '23', selected: true),
                _DateChip(label: '24', selected: false),
                _DateChip(label: '25', selected: false),
                _DateChip(label: '26', selected: false),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text('Select Time', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText, fontSize: 15)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _TimeChip(label: '09:00 AM', selected: false),
              _TimeChip(label: '10:00 AM', selected: false),
              _TimeChip(label: '11:00 AM', selected: false),
              _TimeChip(label: '02:00 PM', selected: true),
              _TimeChip(label: '03:00 PM', selected: false),
              _TimeChip(label: '04:00 PM', selected: false),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppDarkTheme.primary,
                foregroundColor: AppDarkTheme.headerText,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Book Appointment', style: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w600, fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}

class _DateChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _DateChip({required this.label, required this.selected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppDarkTheme.primary : AppDarkTheme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? AppDarkTheme.primary : AppDarkTheme.border),
      ),
      child: Text(label, style: GoogleFonts.poppins(color: selected ? AppDarkTheme.headerText : AppDarkTheme.bodyText, fontWeight: FontWeight.bold)),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _TimeChip({required this.label, required this.selected});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppDarkTheme.primary : AppDarkTheme.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: selected ? AppDarkTheme.primary : AppDarkTheme.border),
      ),
      child: Text(label, style: GoogleFonts.poppins(color: selected ? AppDarkTheme.headerText : AppDarkTheme.bodyText, fontWeight: FontWeight.bold)),
    );
  }
} 