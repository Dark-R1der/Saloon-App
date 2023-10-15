import 'package:flutter/material.dart';
import '../models/salon.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: salons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(salons[index].name),
            onTap: () {
              // Navigate to detail page when a salon is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(salon: salons[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
