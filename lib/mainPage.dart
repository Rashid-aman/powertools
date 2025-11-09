import 'package:flutter/material.dart';
import 'package:powertools/pages/listWarranty.dart';
import 'package:powertools/pages/submitWarranty.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _WarrantyHomeState();
}

class _WarrantyHomeState extends State<Mainpage> {
  // ---- Build UI ----
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Warranty Management"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => listWarranty()),
                );
              },
              child: Text("Retrieve Warranty"),
            ),

            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => submitWarranty()),
                );
              },
              child: Text("Submit Warranty"),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
