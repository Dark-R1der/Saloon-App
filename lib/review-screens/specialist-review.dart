import 'package:flutter/material.dart';

class SalonApp extends StatelessWidget {
  const SalonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dummy Image UI'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/dummy_image.png'),
              const SizedBox(height: 20),
              Image.asset('assets/dummy_image.png'),
              const SizedBox(height: 20),
              Image.asset('assets/dummy_image.png'),
            ],
          ),
        ),
      ),
    );
  }
}
