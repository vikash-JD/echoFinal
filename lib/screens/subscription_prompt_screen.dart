import 'package:flutter/material.dart';

class SubscriptionPromptScreen extends StatelessWidget {
  const SubscriptionPromptScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subscribe')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have reached your free test limit. Subscribe to unlock unlimited tests!', style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/mode', (route) => false),
              child: const Text('Back to Mode Selection'),
            ),
          ],
        ),
      ),
    );
  }
} 