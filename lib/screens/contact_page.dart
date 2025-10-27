import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  static const LatLng _center = LatLng(33.6844, 73.0479); // 📍 Islamabad (Change as needed)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("📞 Contact Us"),
        backgroundColor: Colors.green.shade700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 💚 App info
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: Colors.green.shade50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("🌿 Leaf Guard", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(height: 10),
                  Text("Your plant health companion. Get real-time analysis and expert tips to keep your plants thriving!",
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 📍 Contact details
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("Phone"),
              subtitle: const Text("+92 300 1234567"),
            ),
            ListTile(
              leading: const Icon(Icons.email, color: Colors.green),
              title: const Text("Email"),
              subtitle: const Text("support@leafguard.ai"),
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.green),
              title: const Text("Address"),
              subtitle: const Text("Green Tech Block, Islamabad, Pakistan"),
            ),

            const SizedBox(height: 20),

            // 🗺 Google Map
            SizedBox(
              height: 300,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: _center,
                  zoom: 14.0,
                ),
                markers: {
                  const Marker(
                    markerId: MarkerId('leaf_guard'),
                    position: _center,
                    infoWindow: InfoWindow(title: "Leaf Guard Office"),
                  )
                },
                zoomControlsEnabled: true,
                mapType: MapType.normal,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
