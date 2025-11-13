import 'package:flutter/material.dart';
import 'package:powertools/main.dart';
import 'package:powertools/pages/entryWarranty.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(), // Reusable App Bar
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            // Placeholder for the scanner reticle
            Container(
              height: 250.0,
              width: 250.0,
              padding: const EdgeInsets.all(24.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kPrimaryColor, width: 4.0),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'ClaimIQ',
                      style: TextStyle(color: kPrimaryColor),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            // Scan Button
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Implement OCR Scan Logic
                // On scan complete, navigate to the entry screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WarrantyEntryScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.qr_code_scanner, size: 28.0),
              label: const Text(
                'Scan',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

// A reusable App Bar for the main screens
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false, // No back button
      title: Row(
        children: [
          const CircleAvatar(
            // Placeholder for profile picture
            backgroundImage: NetworkImage(
              'https://placehold.co/100x100/E1E1E1/333333?text=S',
            ),
            radius: 20.0,
          ),
          const SizedBox(width: 12.0),
          Text(
            'Hi Sarah!',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
