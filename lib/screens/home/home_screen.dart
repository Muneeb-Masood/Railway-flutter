import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/booking/booking_screen.dart';
import 'package:flutter_railway_app/screens/flight/flight_screen_model.dart';
import 'package:flutter_railway_app/screens/home/home_model_impl.dart';
import 'package:flutter_railway_app/widgets/date_picker.dart';

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
      body: SingleChildScrollView(
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
       Container(
  padding: const EdgeInsets.all(18),
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
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // FROM Dropdown
      Row(
        children: [
          Icon(Icons.location_on_outlined, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _fromValue,
              items: kCountries.map((country) {
                return DropdownMenuItem(
                  value: country['code'],
                  child: Text(
                    '${country['name']} (${country['code']})',                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _fromValue = value;
                  FlightModel.fromValue = value!;
                  if (_toValue == value) _toValue = null;
                });
              },
              decoration: InputDecoration(
                hintText: "From where",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        
        ],
      ),
      const SizedBox(height: 18),

      // TO Dropdown
      Row(
        children: [
          Icon(Icons.flight_takeoff, color: Colors.grey[400]),
          const SizedBox(width: 8),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _toValue,
              items: kCountries
    .where((country) => country['code'] != _fromValue)
    .map((country) {
            return DropdownMenuItem(
              value: country['code'],
              child: Text(
                '${country['name']} (${country['code']})',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            );
          }).toList(),
              onChanged: (value) {
                setState(() {
                  _toValue = value;
                  FlightModel.toValue = value!;
                });
              },
              decoration: InputDecoration(
                hintText: "Where you to go?",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(height: 18),

      // Date Picker Row
      Row(
        children: [
          IconButton(
            onPressed: () async {
              await modelImpl.showDatePicker(context);
              setState(() {});
            },
            icon: Icon(Icons.calendar_today, color: Colors.grey[400]),
          ),
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
      // ...after the Search button and before the rest of your layout...
const SizedBox(height: 32),
const Text(
  "Destinations",
  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
),
const SizedBox(height: 16),
const SizedBox(height: 16),
SizedBox(
  height: 210,
  child: LayoutBuilder(
    builder: (context, constraints) {
      double cardWidth = MediaQuery.of(context).size.width * 0.42; // ~2.3 cards on screen
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: modelImpl.model.destinations.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final dest = modelImpl.model.destinations[index];
          return Container(
            width: cardWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  child: Image.network(
                    dest['image']!,
                    height: 110,
                    width: cardWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dest['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'From ${dest['price']}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  ),
),          ],
  ),
),

            // … rest of your layout unchanged …
          ],
        ),
      ),

      // bottomNavigationBar unchanged
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
