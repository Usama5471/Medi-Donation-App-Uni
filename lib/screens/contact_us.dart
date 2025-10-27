import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  late GoogleMapController mapController;

  final LatLng _leafGuardLocation = const LatLng(33.6844, 73.0479); // Example: Islamabad

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📍 Contact Us'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '🌿 Leaf Guard\n\nHelping you protect your plants with AI detection, remedies, and care tips.\n\n📞 Contact: +92 300 1234567',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const Text('🗺️ Our Location:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) => mapController = controller,
              initialCameraPosition: CameraPosition(
                target: _leafGuardLocation,
                zoom: 14.0,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('leafGuard'),
                  position: _leafGuardLocation,
                  infoWindow: const InfoWindow(title: 'Leaf Guard HQ'),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
