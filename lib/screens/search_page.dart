import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;
import 'package:leaf_guard/screens/prediction_result.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ImagePicker picker = ImagePicker();
  File? _selectedImage;

  final SpeechToText _speech = SpeechToText();
  String _voiceText = '';

  // 📷 Pick Image from Camera
  Future<void> _pickFromCamera() async {
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() => _selectedImage = File(picked.path));
    }
  }

  // 🖼 Pick Image from Gallery
  Future<void> _pickFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _selectedImage = File(pickedFile.path));
    }
  }

  // 🎤 Start Voice to Text (Urdu/English)
  Future<void> _startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(onResult: (result) {
        setState(() => _voiceText = result.recognizedWords);
      });
    }
  }

  // 📡 Send image + voice to AI backend
  Future<void> _sendToAIBackend() async {
    if (_selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select an image first")));
      return;
    }

    final uri = Uri.parse('https://leafguard-ai.onrender.com/predict'); // ✅ Your deployed backend

    var request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('image', _selectedImage!.path))
      ..fields['description'] = _voiceText;

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final result = jsonDecode(responseBody);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PredictionResultPage(
            prediction: result['prediction'],
            health: result['health'],
            advice: result['advice'],
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ Failed to get prediction")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🔍 Search Plant')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.photo_library),
              label: const Text('Upload from Gallery'),
              onPressed: _pickFromGallery,
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              icon: const Icon(Icons.camera_alt),
              label: const Text('Capture from Camera'),
              onPressed: _pickFromCamera,
            ),
            const SizedBox(height: 20),

            if (_selectedImage != null)
              Image.file(_selectedImage!, height: 200)
            else
              const Text('No image selected'),

            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.mic),
              label: const Text("Speak Disease Description"),
              onPressed: _startListening,
            ),
            const SizedBox(height: 10),
            Text(
              'You said: $_voiceText',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            // ✅ AI Detection Button
            ElevatedButton.icon(
              icon: const Icon(Icons.science),
              label: const Text("🌿 Use AI Detection"),
              onPressed: _sendToAIBackend,
            ),
          ],
        ),
      ),
    );
  }
}
