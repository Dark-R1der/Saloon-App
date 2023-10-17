import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double initialRating;
  final IconData filledIcon;
  final IconData emptyIcon;
  final double size;
  final bool isHalfAllowed;

  RatingBar({
    Key? key,
    required this.initialRating,
    required this.filledIcon,
    required this.emptyIcon,
    this.size = 24.0,
    this.isHalfAllowed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final starValue = index + 1;
        Icon icon;

        if (isHalfAllowed) {
          if (starValue <= initialRating) {
            icon = Icon(filledIcon, color: Colors.yellow, size: size);
          } else if (starValue - 0.5 <= initialRating) {
            icon = Icon(filledIcon, color: Colors.yellow, size: size);
          } else {
            icon = Icon(emptyIcon, color: Colors.yellow, size: size);
          }
        } else {
          icon = starValue <= initialRating
              ? Icon(filledIcon, color: Colors.yellow, size: size)
              : Icon(emptyIcon, color: Colors.yellow, size: size);
        }

        return icon;
      }),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Glamour Haven'),
        ),
        body: ListView(
          children: [
            // Image of the salon
            Image.asset('assets/images/salon.jpg'),

            // Text about the salon
            Text(
              'Salon Description: location, timings, etc...',
              style: TextStyle(fontSize: 16),
            ),

            // Rating section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Your overall rating of this product'),
                RatingBar(
                  initialRating: 4.8,
                  filledIcon: Icons.star,
                  emptyIcon: Icons.star_border,
                  size: 30,
                  isHalfAllowed: true,
                ),
              ],
            ),

            // Review section
            Column(
              children: [
                Text('Add a detailed review'),
                TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                  ),
                ),
              ],
            ),

            // Add photo section
            Column(
              children: [
                Text('Add photo'),
                TextButton(
                  onPressed: () {},
                  child: Text('Add photo'),
                ),
              ],
            ),

            // Submit button
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
