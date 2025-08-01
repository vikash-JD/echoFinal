import 'package:flutter/material.dart';

class ThresholdSliderScreen extends StatefulWidget {
  const ThresholdSliderScreen({Key? key}) : super(key: key);

  @override
  State<ThresholdSliderScreen> createState() => _ThresholdSliderScreenState();
}

class _ThresholdSliderScreenState extends State<ThresholdSliderScreen> {
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estimate Threshold')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Use the slider to estimate your hearing threshold.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 32),
            Slider(
              value: _sliderValue,
              onChanged: (v) => setState(() => _sliderValue = v),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/game'),
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
} 