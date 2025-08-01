import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Top Doctors', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          _DoctorCard(
            name: 'Dr. Rishi',
            specialty: 'ENT / Otolaryngologist',
            distance: '800m away',
            image: 'https://randomuser.me/api/portraits/men/32.jpg',
          ),
          const SizedBox(height: 18),
          _DoctorCard(
            name: 'Dr. Vaomana',
            specialty: 'Audiologist',
            distance: '1.2km away',
            image: 'https://randomuser.me/api/portraits/women/65.jpg',
          ),
          const SizedBox(height: 18),
          _DoctorCard(
            name: 'Dr. Nallorasi',
            specialty: 'Otolaryngologist',
            distance: '2.0km away',
            image: 'https://randomuser.me/api/portraits/men/45.jpg',
          ),
          const SizedBox(height: 18),
          _DoctorCard(
            name: 'Dr. Nihal',
            specialty: 'Audiologist',
            distance: '800m away',
            image: 'https://randomuser.me/api/portraits/men/46.jpg',
          ),
          const SizedBox(height: 18),
          _DoctorCard(
            name: 'Dr. Rishita',
            specialty: 'Audiologist',
            distance: '800m away',
            image: 'https://randomuser.me/api/portraits/women/47.jpg',
          ),
        ],
      ),
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String distance;
  final String image;
  const _DoctorCard({required this.name, required this.specialty, required this.distance, required this.image});
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppDarkTheme.primary.withOpacity(0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(image),
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText, fontSize: 16)),
                Text(specialty, style: GoogleFonts.poppins(color: AppDarkTheme.bodyText, fontSize: 13)),
                Text(distance, style: GoogleFonts.poppins(color: AppDarkTheme.accent, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 