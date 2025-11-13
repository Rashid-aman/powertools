import 'package:flutter/material.dart';
import 'package:powertools/pages/loginPage.dart';
import 'dart:async';
import 'main.dart'; // To get kPrimaryColor

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for your logo
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  // Replace with your actual logo asset
                  child: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 60.0,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'ClaimIQ',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
          // Bottom wave placeholder
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: WavePlaceholder(), // Reusable wave widget
          ),
        ],
      ),
    );
  }
}

// A placeholder for the purple wave shape
// In a real app, you would replace this with an SVG or CustomPainter
class WavePlaceholder extends StatelessWidget {
  const WavePlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.0),
          topRight: Radius.circular(100.0),
        ),
      ),
    );
  }
}
