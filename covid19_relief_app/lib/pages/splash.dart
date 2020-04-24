import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "images/image1.jpg",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
