import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AIDetector {
  /// This function sends an image to the AI server and returns result
  Future<String> sendToAI(File imageFile) async {
    final uri = Uri.parse("https://leafguard.ai/predict"); // Replace with your actual endpoint

    try {
      // Preparing multipart request
      final request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      // Sending the request
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);

        // Return a formatted result
        return "✅ Result: ${data['prediction']}\n"
            "🩺 Health: ${data['health']}\n"
            "💡 Tip: ${data['advice']}";
      } else {
        return "❌ API Error: ${response.statusCode}";
      }
    } catch (e) {
      return "⚠️ Error: $e";
    }
  }
}
