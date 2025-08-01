import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/app_button.dart';
import '../widgets/animated_page_route.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _goToLisa(BuildContext context) {
    Navigator.pushNamed(context, '/lisa');
  }

  void _goToEchoScan(BuildContext context) {
    Navigator.pushNamed(context, '/mode_select');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppDarkTheme.base, AppDarkTheme.background],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: AppDarkTheme.primary,
                    child: Icon(Icons.person, color: Colors.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('welcome |', style: GoogleFonts.poppins(fontSize: 14, color: AppDarkTheme.bodyText)),
                      Text('Olivia', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
                      Text('How is it going today ?', style: GoogleFonts.poppins(fontSize: 13, color: AppDarkTheme.bodyText.withOpacity(0.7))),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GlassCard(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppDarkTheme.accent),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        style: GoogleFonts.poppins(color: AppDarkTheme.bodyText),
                        decoration: InputDecoration(
                          hintText: 'Search doctors, assistant, services...',
                          hintStyle: GoogleFonts.poppins(color: AppDarkTheme.bodyText.withOpacity(0.7)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => _goToEchoScan(context),
                    child: _QuickAction(icon: Icons.hearing, label: 'Echo Scan'),
                  ),
                  GestureDetector(
                    onTap: () => _goToLisa(context),
                    child: _QuickAction(icon: Icons.chat_bubble, label: 'Ask LISA'),
                  ),
                  _QuickAction(icon: Icons.play_circle_fill, label: 'ECHO Guide', onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => EchoGuideInfoScreen()),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("What's up?", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText, fontSize: 16)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Column(
                children: [
                  GlassCard(
                    child: ListTile(
                      leading: const Icon(Icons.article, color: AppDarkTheme.accent),
                      title: Text('Why Regular Hearing Checkups Matter More Than You Think', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                      subtitle: Text('Read more', style: GoogleFonts.poppins(color: AppDarkTheme.accent)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GlassCard(
                    child: ListTile(
                      leading: const Icon(Icons.article, color: AppDarkTheme.accent),
                      title: Text('Can Loud Music Damage Your Hearing?', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                      subtitle: Text('Read more', style: GoogleFonts.poppins(color: AppDarkTheme.accent)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  GlassCard(
                    child: ListTile(
                      leading: const Icon(Icons.article, color: AppDarkTheme.accent),
                      title: Text('Where to Get an Online Hearing Test', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                      subtitle: Text('Read more', style: GoogleFonts.poppins(color: AppDarkTheme.accent)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  const _QuickAction({required this.icon, required this.label, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      child: Column(
        children: [
          Icon(icon, color: AppDarkTheme.primary, size: 28),
          const SizedBox(height: 8),
          Text(label, style: GoogleFonts.poppins(color: AppDarkTheme.bodyText, fontSize: 13)),
        ],
        ),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title Screen (Coming Soon)', style: const TextStyle(fontSize: 22))),
    );
  }
}

class AudiogramMiniChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 5,
        minY: 0,
        maxY: 120,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 20),
              FlSpot(1, 40),
              FlSpot(2, 60),
              FlSpot(3, 50),
              FlSpot(4, 70),
              FlSpot(5, 90),
            ],
            isCurved: false,
            color: Colors.red,
            barWidth: 2,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: [
              FlSpot(0, 30),
              FlSpot(1, 50),
              FlSpot(2, 70),
              FlSpot(3, 60),
              FlSpot(4, 80),
              FlSpot(5, 100),
            ],
            isCurved: false,
            color: Colors.blue,
            barWidth: 2,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(show: false),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(enabled: false),
      ),
    );
  }
}

class EchoGuideInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('ECHO Guide', style: GoogleFonts.montserrat(color: AppDarkTheme.headerText)),
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
                Text('How to use ECHO', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 22, color: AppDarkTheme.headerText), textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text('1. Connect your headphones and find a quiet place.\n\n2. Tap “Echo Scan” to start your hearing test.\n\n3. Follow the on-screen instructions carefully.\n\n4. View your results and reports in the app.\n\n5. Use the chat to ask LISA for help or more info.', style: GoogleFonts.poppins(fontSize: 16, color: AppDarkTheme.bodyText), textAlign: TextAlign.left),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 