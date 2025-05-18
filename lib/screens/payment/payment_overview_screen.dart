import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  OverviewScreen({super.key});

  // Example passenger data
  final List<Map<String, String>> passengers = [
    {
      'name': 'Mr. Phong Van Tran',
      'nationality': 'Vietnam',
      'dob': '15/04/1996',
      'passport': 'D9641312',
      'insurance': 'Travel Plus',
      'bags': '1x',
      'bagDetails': '56x32x36cm, 7kg',
    },
    {
      'name': 'Mr. May Thao Nguyen',
      'nationality': 'Vietnam',
      'dob': '15/04/1996',
      'passport': 'D9641312',
      'insurance': 'Travel Plus',
      'bags': '1x',
      'bagDetails': '56x32x36cm, 7kg',
    },
  ];

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
          "Overview",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // ... Flight details area here ...
          const SizedBox(height: 16),
          const Text(
            "Passengers",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: passengers.length,
            itemBuilder: (context, index) {
              final p = passengers[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFFEEF3FB),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Color(0xFF1A73E8),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.person, color: Colors.grey, size: 32),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            p['name'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () {
                            // Remove passenger logic here
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Nationality\n${p['nationality']}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Date of birth\n${p['dob']}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "Passport\n${p['passport']}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Travel Insurance\n${p['insurance']}",
                            style: const TextStyle(fontSize: 13),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Text("Bags\n", style: TextStyle(fontSize: 13)),
                              Text(
                                "${p['bags']} ",
                                style: const TextStyle(fontSize: 13),
                              ),
                              const Icon(Icons.luggage, size: 16, color: Colors.grey),
                              Text(
                                " ${p['bagDetails']}",
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}