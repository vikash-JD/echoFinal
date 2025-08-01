import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            GlassCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Audiogram Gen', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('43', style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.bold, color: AppDarkTheme.primary)),
                      const SizedBox(width: 8),
                      Text('dB', style: GoogleFonts.poppins(fontSize: 18, color: AppDarkTheme.bodyText)),
                      const Spacer(),
                      Icon(Icons.graphic_eq, color: AppDarkTheme.accent, size: 36),
                    ],
                  ),
                  // TODO: Add fl_chart audiogram here
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _StatusCard(label: 'Hearing Health', value: 'Mild', color: Colors.purple),
                const SizedBox(width: 16),
                _StatusCard(label: 'Not sure?', value: 'Retake', color: Colors.orange),
              ],
            ),
            const SizedBox(height: 32),
            Text('Latest report', style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
            const SizedBox(height: 12),
            GlassCard(
              child: ListTile(
                leading: const Icon(Icons.insert_drive_file, color: AppDarkTheme.accent),
                title: Text('General report', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                subtitle: Text('Jul 10, 2023', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
                trailing: const Icon(Icons.more_horiz, color: AppDarkTheme.bodyText),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AudiogramPdfScreen()),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
            GlassCard(
              child: ListTile(
                leading: const Icon(Icons.insert_drive_file, color: AppDarkTheme.accent),
                title: Text('General report', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
                subtitle: Text('Jul 5, 2023', style: GoogleFonts.poppins(color: AppDarkTheme.bodyText)),
                trailing: const Icon(Icons.more_horiz, color: AppDarkTheme.bodyText),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _StatusCard({required this.label, required this.value, required this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GlassCard(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(label, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            Text(value, style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class AudiogramPdfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Audiogram PDF', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppDarkTheme.base,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Audiogram Chart', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20)),
              const SizedBox(height: 24),
              SizedBox(
                width: 320,
                height: 220,
                child: LineChart(
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
                        barWidth: 3,
                        dotData: FlDotData(show: true),
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
                        barWidth: 3,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 36,
                          getTitlesWidget: (value, meta) {
                            if (value % 20 == 0) {
                              return Text('${value.toInt()}', style: TextStyle(color: Colors.white));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const freqs = ['250', '500', '1k', '2k', '4k', '8k'];
                            int idx = value.toInt();
                            if (idx >= 0 && idx < freqs.length) {
                              return Text(freqs[idx], style: TextStyle(color: Colors.white));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(show: true, horizontalInterval: 20),
                    borderData: FlBorderData(show: true),
                    lineTouchData: LineTouchData(enabled: true),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 