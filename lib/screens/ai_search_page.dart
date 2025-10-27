import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'dart:convert';

class AISearchPage extends StatefulWidget {
  const AISearchPage({super.key});

  @override
  State<AISearchPage> createState() => _AISearchPageState();
}

class _AISearchPageState extends State<AISearchPage> {
  File? _image;
  String _result = '';
  bool _loading = false;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _textController = TextEditingController();

  // 📌 Ask permissions
  Future<void> _askPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();
    await Permission.storage.request();
  }

  // 📷 Pick and Analyze
  Future<void> _pickAndAnalyze(ImageSource source) async {
    await _askPermissions();
    final file = await _picker.pickImage(source: source);
    if (file == null) return;
    setState(() {
      _image = File(file.path);
      _result = "⏳ Analyzing...";
      _loading = true;
    });
    await _sendToAI(_image!);
  }

  // 🧠 Send to AI API
  Future<void> _sendToAI(File image) async {
    try {
      final uri = Uri.parse("https://leafguard.ai/predict"); // Replace with actual
      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('image', image.path));

      final response = await request.send();
      if (response.statusCode == 200) {
        final body = await response.stream.bytesToString();
        final data = json.decode(body);
        setState(() {
          _result = "🌿 **Plant:** ${data['prediction']}\n\n"
              "💚 **Health:** ${data['health']}\n\n"
              "💡 **Advice:** ${data['advice']}";
        });
      } else {
        setState(() => _result = '❌ Error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _result = '⚠️ Error: ${e.toString()}');
    } finally {
      setState(() => _loading = false);
    }
  }

  // 📝 Send typed text to AI (placeholder function)
  void _sendTextToAI() {
    String query = _textController.text.trim();
    if (query.isEmpty) return;
    setState(() {
      _result = "🔍 Searching for \"$query\"...";
    });

    // 💡 Placeholder logic for text
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _result = "🌿 Plant: Neem\n💚 Health: Healthy\n💡 Advice: Water regularly, avoid overexposure.";
      });
    });
  }

  // 🎤 Placeholder for voice feature
  void _recordVoiceMessage() {
    setState(() {
      _result = "🎤 Voice input feature coming soon...";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("🔍 AI Plant Search"),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_image != null) Image.file(_image!, height: 200),
            const SizedBox(height: 16),

            // 📷 Camera & Gallery buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_camera),
                  label: const Text("Camera"),
                  onPressed: () => _pickAndAnalyze(ImageSource.camera),
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_library),
                  label: const Text("Gallery"),
                  onPressed: () => _pickAndAnalyze(ImageSource.gallery),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ✍️ Text input
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Enter plant name (Eng / Urdu / Roman Urdu)",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendTextToAI,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 🎤 Voice input button
            ElevatedButton.icon(
              icon: const Icon(Icons.mic),
              label: const Text("Voice Input"),
              onPressed: _recordVoiceMessage,
            ),

            const SizedBox(height: 24),

            // 🧠 AI result
            if (_loading)
              const CircularProgressIndicator()
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
