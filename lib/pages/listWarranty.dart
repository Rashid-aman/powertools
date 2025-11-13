import 'package:flutter/material.dart';
import 'package:powertools/main.dart';
import 'package:powertools/pages/entryWarranty.dart';
import 'package:powertools/pages/scanPage.dart';

class WarrantyListScreen extends StatelessWidget {
  const WarrantyListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(), // Reusable app bar
      body: Column(
        children: [
          // Search Bar Area
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter Serial Number',
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  icon: const Icon(
                    Icons.filter_list,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () {
                    // TODO: Show filter options
                  },
                ),
              ],
            ),
          ),

          // Separator Line
          const Divider(thickness: 2.0, color: kPrimaryColor, height: 1.0),

          // Warranty List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: const [
                // Example warranty cards from your design
                WarrantyCard(
                  name: 'John Doe',
                  serial: 'SKT15763',
                  expiryDate: '10-11-2025',
                  color: Colors.blue, // As seen in design
                ),
                WarrantyCard(
                  name: 'Steve Rogers',
                  serial: 'SKT33672',
                  expiryDate: '24-01-2025',
                  color: Colors.blue,
                ),
                WarrantyCard(
                  name: 'Peter Parker',
                  serial: 'SKT62748',
                  expiryDate: '07-08-2024',
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// A widget for the blue warranty cards
class WarrantyCard extends StatelessWidget {
  final String name;
  final String serial;
  final String expiryDate;
  final Color color;

  const WarrantyCard({
    Key? key,
    required this.name,
    required this.serial,
    required this.expiryDate,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to a detail view
          // For now, let's go to the entry screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WarrantyEntryScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expiryDate,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                serial,
                style: const TextStyle(color: Colors.white70, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
