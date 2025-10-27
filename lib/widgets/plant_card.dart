import 'package:flutter/material.dart';
import '../models/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Show multiple images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: plant.imagePaths.map((img) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(img, width: 60, height: 60, fit: BoxFit.cover),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Text(
              plant.englishName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            Text('(${plant.romanUrduName}) - ${plant.name}', style: const TextStyle(fontSize: 14)),
            Text('Bio: ${plant.botanicalName}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(plant.description, style: const TextStyle(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
