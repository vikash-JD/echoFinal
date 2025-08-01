import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'glass_card.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool loading;
  final bool glass;
  const AppButton({Key? key, required this.text, this.onPressed, this.icon, this.loading = false, this.glass = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton.icon(
      onPressed: loading ? null : onPressed,
      icon: icon != null ? Icon(icon, size: 20) : const SizedBox.shrink(),
      label: loading
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
          : Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: glass ? Colors.white.withOpacity(0.18) : AppTheme.primary,
        foregroundColor: glass ? AppTheme.primary : Colors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: glass ? 0 : 2,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      ),
    );
    return glass ? GlassCard(child: btn, padding: EdgeInsets.zero) : btn;
  }
} 