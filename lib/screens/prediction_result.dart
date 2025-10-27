import 'package:flutter/material.dart';

class PredictionResultPage extends StatelessWidget {
  final String prediction;
  final String health;
  final String advice;

  const PredictionResultPage({
    super.key,
    required this.prediction,
    required this.health,
    required this.advice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🌱 AI Result')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Prediction:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                Text(
                  prediction,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Health Status:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.brown),
                ),
                Text(
                  health,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Suggested Advice:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                ),
                Text(
                  advice,
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.home),
                    label: const Text("Back to Search"),
                    onPressed: () => Navigator.pop(context),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
