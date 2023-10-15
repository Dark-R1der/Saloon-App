import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  CircleIcon({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.red[100],
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.red,
              size: 30,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(text),
      ],
    );
  }
}
