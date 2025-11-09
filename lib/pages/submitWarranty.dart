import 'package:flutter/material.dart';

class submitWarranty extends StatefulWidget {
  const submitWarranty({super.key});

  @override
  State<submitWarranty> createState() => _submitWarrantyState();
}

class _submitWarrantyState extends State<submitWarranty> {
  // Controllers
  final _productController = TextEditingController();
  final _customerController = TextEditingController();
  final _serialController = TextEditingController();
  DateTime? _purchaseDate;
  DateTime? _expiryDate;

  // Placeholder list for display only
  final List<Map<String, dynamic>> _dummyList = [];

  void _submitWarranty() {
    // TODO: Add your backend submit logic here
    setState(() {
      _dummyList.add({
        "product": _productController.text,
        "customer": _customerController.text,
        "serial": _serialController.text,
        "purchase": _purchaseDate,
        "expiry": _expiryDate,
      });
    });

    _productController.clear();
    _customerController.clear();
    _serialController.clear();
    _purchaseDate = null;
    _expiryDate = null;
  }

  Future<void> _pickDate(bool isPurchase) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isPurchase) {
          _purchaseDate = picked;
        } else {
          _expiryDate = picked;
        }
      });
    }
  }

  // UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SUBMIT WARRANTY
      appBar: AppBar(title: Text("Submit Warranty")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Input fields
            TextField(
              controller: _productController,
              decoration: const InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _customerController,
              decoration: const InputDecoration(
                labelText: "Customer Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _serialController,
              decoration: const InputDecoration(
                labelText: "Serial Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),

            // Date pickers
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickDate(true),
                    child: Text(
                      _purchaseDate == null
                          ? "Select Purchase Date"
                          : "Purchase: ${_purchaseDate!.toLocal()}".split(
                              ' ',
                            )[0],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickDate(false),
                    child: Text(
                      _expiryDate == null
                          ? "Select Expiry Date"
                          : "Expiry: ${_expiryDate!.toLocal()}".split(' ')[0],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Submit Warranty"),
                onPressed: _submitWarranty, // You can link backend here
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
