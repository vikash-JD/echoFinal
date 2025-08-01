import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audiometry Game')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO: Integrate Unity widget here using flutter_unity_widget
            // TODO: Set up platform channel for Unity <-> Flutter communication
            const Text('Unity Audiometry Game Placeholder', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/result'),
              child: const Text('Finish Test'),
            ),
          ],
        ),
      ),
    );
  }
} 