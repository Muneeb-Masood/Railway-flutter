import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/booking/booking_screen.dart';
import 'package:flutter_railway_app/screens/home/home_model_impl.dart';
import 'package:flutter_railway_app/widgets/date_picker.dart';

// ...existing code above...
const List<Map<String, String>> kCountries = [
  {'code': 'PK', 'name': 'Pakistan'},
  {'code': 'US', 'name': 'United States'},
  {'code': 'UK', 'name': 'United Kingdom'},
  {'code': 'IN', 'name': 'India'},
  {'code': 'CA', 'name': 'Canada'},
  {'code': 'AU', 'name': 'Australia'},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeModelImpl get modelImpl => HomeModelImpl();

  int _selectedIndex = 0;
  String? _fromValue;
  String? _toValue;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8),
            child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              "Travel the world\nmade simple",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF222B45),
              ),
            ),
            const SizedBox(height: 28),
            // Main Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // FROM Row
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.grey[700]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _fromValue != null
                              ? '${kCountries.firstWhere((c) => c['code'] == _fromValue)['name']} (${_fromValue!})'
                              : "Where from?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: _fromValue != null ? Colors.black : Colors.grey[400],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.swap_vert, color: Color(0xFF1A73E8)),
                        onPressed: () {
                          setState(() {
                            final temp = _fromValue;
                            _fromValue = _toValue;
                            _toValue = temp;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // TO Row
                  Row(
                    children: [
                      Icon(Icons.flight_takeoff, color: Colors.grey[400]),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _toValue != null
                              ? '${kCountries.firstWhere((c) => c['code'] == _toValue)['name']} (${_toValue!})'
                              : "Where to go?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: _toValue != null ? Colors.black : Colors.grey[400],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Date Range Row
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F9FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today, color: Colors.grey[400], size: 18),
                        const SizedBox(width: 8),
                        Text(
                          DateRangePickerSheet.initialStart == DateRangePickerSheet.initialEnd
                              ? "Today"
                              : DateRangePickerSheet.initialStart.toString().substring(0, 10),
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (DateRangePickerSheet.initialStart != DateRangePickerSheet.initialEnd)
                          Row(
                            children: [
                              Text("-", style: TextStyle(color: Colors.grey[400])),
                              const SizedBox(width: 8),
                              Text(
                                DateRangePickerSheet.initialEnd.toString().substring(0, 10),
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  // Return, Passengers, Bags Row
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F9FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.keyboard_return, color: Colors.grey[500]),
                        const SizedBox(width: 6),
                        const Text(
                          "Return",
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.person, color: Colors.grey[500], size: 18),
                        const SizedBox(width: 2),
                        const Text("2", style: TextStyle(color: Colors.grey)),
                        const SizedBox(width: 8),
                        Icon(Icons.child_care, color: Colors.grey[500], size: 18),
                        const SizedBox(width: 2),
                        const Text("0", style: TextStyle(color: Colors.grey)),
                        const SizedBox(width: 8),
                        Icon(Icons.luggage, color: Colors.grey[500], size: 18),
                        const SizedBox(width: 2),
                        const Text("0", style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Search Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  await showModalBottomSheet<Map>(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (_) => const PassengerSheet(),
                  );
                },
                child: const Text(
                  "Search",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF1A73E8),
        unselectedItemColor: Colors.grey[400],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 28), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.flight, size: 28), label: 'Flight'),
          BottomNavigationBarItem(icon: Icon(Icons.delete, size: 28), label: 'Delete'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size: 28), label: 'Profile'),
        ],
      ),
    );
  }
}