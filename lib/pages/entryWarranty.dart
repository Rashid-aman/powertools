import 'package:flutter/material.dart';
import 'package:powertools/main.dart';

class WarrantyEntryScreen extends StatefulWidget {
  const WarrantyEntryScreen({Key? key}) : super(key: key);

  @override
  _WarrantyEntryScreenState createState() => _WarrantyEntryScreenState();
}

class _WarrantyEntryScreenState extends State<WarrantyEntryScreen> {
  String? _selectedPeriod = '06 Months'; // Default value for the dropdown
  final List<String> _warrantyPeriods = [
    '03 Months',
    '06 Months',
    '12 Months',
    '24 Months',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://placehold.co/100x100/E1E1E1/333333?text=S',
                  ),
                  radius: 18.0,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Hi Sarah!',
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Warranty information',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Enter Warranty Information',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32.0),

            // --- Form Fields ---
            _buildTextField(label: 'Full Name', hint: 'John Doe'),
            _buildTextField(
              label: 'Mobile Number',
              hint: '077 123 4567',
              keyboardType: TextInputType.phone,
            ),
            _buildTextField(label: 'Serial Number', hint: 'SKT67239'),

            // --- Date of Purchase ---
            _buildDateField(context),
            const SizedBox(height: 24.0),

            // --- Warranty Period Dropdown ---
            _buildDropdownField(),
            const SizedBox(height: 40.0),

            // --- Submit Button ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Save warranty data
                  Navigator.of(context).pop(); // Go back after submit
                },
                child: const Text('Submit', style: TextStyle(fontSize: 18.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for text fields
  Widget _buildTextField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the Date field
  Widget _buildDateField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date of Purchase',
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              hintText: '22-07-2025',
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Colors.grey[300]!),
              ),
              suffixIcon: Icon(Icons.calendar_today, color: Colors.grey[600]),
            ),
            onTap: () {
              // TODO: Show Date Picker
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper widget for the Dropdown
  Widget _buildDropdownField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Warranty Period',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8.0),
        DropdownButtonFormField<String>(
          value: _selectedPeriod,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          items: _warrantyPeriods.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (newValue) {
            setState(() {
              _selectedPeriod = newValue;
            });
          },
        ),
      ],
    );
  }
}
