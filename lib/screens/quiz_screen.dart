import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/app_button.dart';

class QuizScreen extends StatefulWidget {
  final String mode; // 'clinic' or 'game'
  const QuizScreen({Key? key, required this.mode}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How often do you have trouble hearing conversations in a noisy environment?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'Do you find yourself increasing the TV volume frequently?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'How often do you ask people to repeat themselves?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'Do you struggle to hear on the phone?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'Do you feel people are mumbling more than before?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'How often do you miss doorbells or alarms?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'Do you avoid social situations because of hearing difficulty?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'Do you have ringing in your ears (tinnitus)?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'How often do you feel tired from listening?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
    {
      'question': 'Do you have difficulty hearing children or women?',
      'options': ['Never', 'Rarely', 'Sometimes', 'Often']
    },
  ];
  int _current = 0;
  List<int?> _answers = List.filled(10, null);
  bool _showSummary = false;

  void _selectOption(int idx) {
    setState(() {
      _answers[_current] = idx;
    });
  }

  void _next() {
    if (_current < _questions.length - 1) {
      setState(() {
        _current++;
      });
    } else {
      setState(() {
        _showSummary = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isGame = widget.mode == 'game';
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text(isGame ? 'Game Mode Quiz' : 'Clinic Mode Quiz', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _showSummary
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check_circle, color: AppDarkTheme.primary, size: 60),
                    const SizedBox(height: 24),
                    Text('Quiz Complete!', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold, color: AppDarkTheme.headerText)),
                    const SizedBox(height: 16),
                    Text('Thank you for completing the quiz.', style: GoogleFonts.poppins(fontSize: 16, color: AppDarkTheme.bodyText)),
                    const SizedBox(height: 32),
                    if (!isGame)
                      AppButton(
                        text: 'Start Test',
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => ComingSoonScreen()),
                        ),
                        icon: Icons.play_arrow,
                      ),
                    if (isGame)
                      AppButton(
                        text: 'Game Test',
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => UnityLaunchScreen()),
                        ),
                        icon: Icons.sports_esports,
                      ),
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Quiz!!', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 28, color: AppDarkTheme.headerText)),
                      const SizedBox(height: 18),
                      // Progress bar
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: LinearProgressIndicator(
                          value: (_current + 1) / _questions.length,
                          backgroundColor: AppDarkTheme.base.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(AppDarkTheme.primary),
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      GlassCard(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        child: SizedBox(
                          width: 350,
                          height: 260,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                _questions[_current]['question'],
                                style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: AppDarkTheme.headerText),
                              ),
                              const SizedBox(height: 18),
                              ...List.generate(4, (idx) {
                                final selected = _answers[_current] == idx;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: ElevatedButton(
                                    onPressed: () => _selectOption(idx),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: selected ? AppDarkTheme.primary : AppDarkTheme.base,
                                      foregroundColor: selected ? Colors.white : AppDarkTheme.headerText,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                      elevation: selected ? 4 : 0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        _questions[_current]['options'][idx],
                                        style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      AppButton(
                        text: _current == _questions.length - 1 ? 'Finish' : 'Next',
                        onPressed: _answers[_current] != null ? _next : null,
                        icon: Icons.arrow_forward,
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Clinic Mode', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Center(
        child: Text('Clinical mode is coming soon', style: GoogleFonts.poppins(fontSize: 22, color: AppDarkTheme.headerText)),
      ),
    );
  }
}

class UnityLaunchScreen extends StatelessWidget {
  const UnityLaunchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        title: Text('Game Mode', style: GoogleFonts.poppins(color: AppDarkTheme.headerText)),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Center(
        child: Text('Unity game launching here...', style: GoogleFonts.poppins(fontSize: 22, color: AppDarkTheme.headerText)),
      ),
    );
  }
} 