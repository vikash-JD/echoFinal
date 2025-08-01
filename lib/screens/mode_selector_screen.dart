import 'package:flutter/material.dart';

class ModeSelectorScreen extends StatelessWidget {
  const ModeSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Mode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/preparation'),
              child: const Text('Game Mode'),
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Clinical Mode'),
                  content: const Text('Coming Soon!'),
                  actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                ),
              ),
              child: const Text('Clinical Mode'),
            ),
          ],
        ),
      ),
    );
  }
} 