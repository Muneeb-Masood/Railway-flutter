import 'package:flutter/material.dart';

class PassengerSelectionScreen extends StatefulWidget {
  const PassengerSelectionScreen({super.key});

  @override
  State<PassengerSelectionScreen> createState() => _PassengerSelectionScreenState();
}

class _PassengerSelectionScreenState extends State<PassengerSelectionScreen> {
  // Example passenger data
  List<Map<String, dynamic>> passengers = [
    {
      'name': 'Mr. Phong Van Tran',
      'dob': '15/04/1996',
      'passport': '104710',
      'selected': true,
    },
    {
      'name': 'Ms. May Thao Nguyen',
      'dob': '15/04/1996',
      'passport': '104710',
      'selected': true,
    },
    {
      'name': 'Ms. Linh Thi Hoang',
      'dob': '10/09/1992',
      'passport': '067401',
      'selected': false,
    },
    {
      'name': 'Mr. Viet Quoc Hoang',
      'dob': '10/09/1992',
      'passport': '067401',
      'selected': false,
    },
    {
      'name': 'Mr. Dao Hung Tran',
      'dob': '10/09/1992',
      'passport': '067401',
      'selected': false,
    },
    {
      'name': 'Ms. Dieu Quang Ly',
      'dob': '10/09/1992',
      'passport': '067401',
      'selected': false,
    },
  ];

  void _toggleSelect(int index) {
    setState(() {
      passengers[index]['selected'] = !(passengers[index]['selected'] as bool);
    });
  }

  void _editPassenger(int index) {
    // Implement edit logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit ${passengers[index]['name']}')),
    );
  }

  void _addPassenger() {
    setState(() {
      passengers.add({
        'name': 'New Passenger',
        'dob': '01/01/2000',
        'passport': '000000',
        'selected': false,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Passengers",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, passengers.where((p) => p['selected']).toList()),
            child: const Text("Done", style: TextStyle(color: Color(0xFF1A73E8), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.person_add, color: Colors.white),
                label: const Text(
                  "Add a Passenger",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                onPressed: _addPassenger,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: passengers.length,
              itemBuilder: (context, index) {
                final p = passengers[index];
                final selected = p['selected'] as bool;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: Icon(
                      selected ? Icons.check_circle : Icons.radio_button_unchecked,
                      color: selected ? Color(0xFF1A73E8) : Colors.grey[400],
                      size: 28,
                    ),
                    title: Text(
                      p['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: selected ? Colors.black : Colors.grey[600],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          p['dob'],
                          style: TextStyle(
                            color: selected ? Colors.black87 : Colors.grey[400],
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "Passport or ID: ${p['passport']}",
                          style: TextStyle(
                            color: selected ? Colors.black87 : Colors.grey[400],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit, color: Colors.grey),
                      onPressed: () => _editPassenger(index),
                    ),
                    onTap: () => _toggleSelect(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}