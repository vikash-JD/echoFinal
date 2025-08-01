import 'package:flutter/material.dart';
import '../themes/app_theme.dart';
import 'glass_card.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final IconData icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool glass;
  const AppTextField({Key? key, this.controller, required this.label, required this.icon, this.obscureText = false, this.keyboardType, this.validator, this.glass = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final field = TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(fontFamily: 'Poppins'),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        filled: glass,
        fillColor: glass ? Colors.white.withOpacity(0.18) : null,
      ),
    );
    return glass ? GlassCard(child: field, padding: EdgeInsets.zero) : field;
  }
} 