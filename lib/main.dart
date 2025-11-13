import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powertools/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

// Define the primary color from your designs
// const Color kPrimaryColor = Color.fromARGB(255, 46, 139, 87);
const Color kPrimaryColor = Color(0xFF6A1B9A); // A deep purple
const Color kPrimaryLightColor = Color(
  0xFFF3E5F5,
); // A light purple for backgrounds

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClaimIQ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        // Apply the Poppins font as the default
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        // Style for ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, // Purple background
            foregroundColor: Colors.white, // White text
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ),
        // Style for input fields
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none, // No border, as in login.png
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          labelStyle: const TextStyle(color: Colors.grey),
        ),
      ),
      home: const SplashScreen(), // Start with the splash screen
    );
  }
}
