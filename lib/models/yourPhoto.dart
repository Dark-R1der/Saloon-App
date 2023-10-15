// Define your photo data or URLs as a list of strings
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> yourPhotoList = [
  '../assets/salon_images/gallery/img.png',
'../assets/salon_images/gallery/img_1.png',
'../assets/salon_images/gallery/img_2.png',
'../assets/salon_images/gallery/img_3.png',
  // Add more photo URLs here
];

// Define a simple widget to display photos
class YourPhotoWidget extends StatelessWidget {
  final String photoUrl;

  YourPhotoWidget(this.photoUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.red, // You can customize the shadow color
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.network(
        photoUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
