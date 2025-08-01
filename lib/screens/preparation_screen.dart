import 'package:flutter/material.dart';

class PreparationScreen extends StatelessWidget {
  const PreparationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preparation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Please wear headphones/earphones.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            const Text('Ensure the environment is quieter than 40 dB (simulated).', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/quiz'),
              child: const Text('I am ready'),
            ),
          ],
        ),
      ),
    );
  }
} 