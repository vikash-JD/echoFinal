import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../themes/dark_theme.dart';
import '../widgets/glass_card.dart';

class LisaChatScreen extends StatelessWidget {
  const LisaChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppDarkTheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.hearing, color: AppDarkTheme.accent),
            const SizedBox(width: 8),
            Text('LISA', style: GoogleFonts.poppins(color: AppDarkTheme.headerText, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: AppDarkTheme.base,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppDarkTheme.accent),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
            children: [
              _ChatBubble(text: "Let's do the full test", isUser: true),
              const SizedBox(height: 24),
              _ChatBubble(text: "Awesome! I'll guide you through it step-by-step. Make sure you're in a quiet place and using headphones. Ready to begin?", isUser: false),
              const SizedBox(height: 24),
              _ChatBubble(text: "Yes, I am ready", isUser: true),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: GlassCard(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.poppins(color: AppDarkTheme.bodyText),
                      decoration: InputDecoration(
                        hintText: 'Ask LISA',
                        hintStyle: GoogleFonts.poppins(color: AppDarkTheme.bodyText.withOpacity(0.7)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_1pxqjqps.json',
                    height: 36,
                    width: 36,
                    repeat: true,
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppDarkTheme.accent),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  const _ChatBubble({required this.text, required this.isUser});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: GlassCard(
        color: isUser ? AppDarkTheme.primary.withOpacity(0.18) : AppDarkTheme.card,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: isUser ? AppDarkTheme.primary : AppDarkTheme.bodyText,
            fontWeight: isUser ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
} 