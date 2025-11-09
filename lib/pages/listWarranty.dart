import 'package:flutter/material.dart';

class listWarranty extends StatefulWidget {
  const listWarranty({super.key});

  @override
  State<listWarranty> createState() => _listWarrantyState();
}

class _listWarrantyState extends State<listWarranty> {
  // Placeholder list for display only
  // Placeholder list for display only
  final List<Map<String, dynamic>> _dummyList = [
    {
      "product": "GigaWidget Pro",
      "customer": "Alice Smith",
      "serial": "GW-98765A",
      "purchase": DateTime(2024, 10, 15),
      "expiry": DateTime(2025, 10, 14),
    },
    {
      "product": "MegaCore Laptop",
      "customer": "Bob Johnson",
      "serial": "MC-12345B",
      "purchase": DateTime(2024, 11, 20),
      "expiry": DateTime(2026, 11, 19),
    },
    {
      "product": "HyperSound Headphones",
      "customer": "Charlie Lee",
      "serial": "HS-45678C",
      "purchase": DateTime(2025, 1, 5),
      "expiry": DateTime(2026, 1, 4),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Submitted Warranties")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///// LIST WARRANTY
            const SizedBox(height: 10),

            // Display List
            _dummyList.isEmpty
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text("No warranties submitted yet"),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _dummyList.length,
                    itemBuilder: (context, index) {
                      final w = _dummyList[index];
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.check_circle_outline),
                          title: Text(w["product"] ?? ""),
                          subtitle: Text(
                            "Customer: ${w["customer"]}\nSerial: ${w["serial"]}",
                          ),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
