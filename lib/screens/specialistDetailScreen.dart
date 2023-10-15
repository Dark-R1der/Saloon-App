import 'package:flutter/material.dart';
import 'package:saloonapp/models/specialist.dart';

class SpecialistDetailScreen extends StatelessWidget {
  final Specialist specialist;

  SpecialistDetailScreen({required this.specialist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialist Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              specialist.imageAssetPath,
              fit: BoxFit.cover,
              height: 150, // Set the desired height for the specialist image
            ),
            Text(
              specialist.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              specialist.domain,
              style: TextStyle(fontSize: 18),
            ),
            // Add more specialist details here as needed
          ],
        ),
      ),
    );
  }
}
