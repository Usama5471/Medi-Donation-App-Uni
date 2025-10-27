import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("🎉 About Leaf Guard")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: const [
                  Icon(Icons.eco, size: 60, color: Colors.green),
                  SizedBox(height: 10),
                  Text("Leaf Guard", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  Text("Version 1.0.0", style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 30),

            const Text("👩‍💻 Developed By:", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Sara (🌸)", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            const Text("🌐 Purpose:", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("This app helps users identify plant health using images, voice, and AI. Designed to support plant lovers and gardeners.", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),

            const Text("🌈 Positive Quote:", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("“Just like plants, we bloom with care.”", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
            const SizedBox(height: 20),

            const Text("❤️ Thanks To:", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Flutter, Firebase, OpenAI, Nature, and You!", style: TextStyle(fontSize: 16)),

            const Spacer(),

            Center(
              child: Text(
                "© 2025 Leaf Guard. All rights reserved.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
