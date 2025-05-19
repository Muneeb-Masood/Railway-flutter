import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_railway_app/helper_funtions/helper_functions.dart';
import 'package:flutter_railway_app/models/all_trains_data_model.dart';
import 'package:flutter_railway_app/screens/payment/bill_screen.dart';
import 'flight_screen_model.dart';

class FlightResultsModelImpl {
  final Function() onUpdate;
  final Map<String, dynamic> extraParams;
  String? fromValue;
  String? toValue;

  final FlightModel _model = FlightModel();

  FlightResultsModelImpl({required this.onUpdate, required this.extraParams});

  FlightModel get model => _model;

  Widget buildScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(title: const Text("Flight Results")),
      body: ListView(
        children: [
          _flightInfo(),
          // _buildFilters(),
          _buildFlightList(context),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Row(
        children: List.generate(model.filters.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChoiceChip(
              label: Text(model.filters[index]),
              selected: model.selectedFilter == index,
              selectedColor: const Color(0xFF1A73E8),
              labelStyle: TextStyle(
                color: model.selectedFilter == index ? Colors.white : Colors.black,
              ),
              onSelected: (_) {
                model.selectedFilter = index;
                onUpdate();
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildFlightList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: model.flights.length,
      itemBuilder: (context, index) {
        final flight = model.flights[index];
        return GestureDetector(
          onTap: () {
  int adults = int.tryParse(extraParams['adults']?.toString() ?? '1') ?? 1;
  int infants = int.tryParse(extraParams['infants']?.toString() ?? '0') ?? 0;
  int adultFare = 20000;
  int infantFare = 1000;
  int subtotal = (adults * adultFare) + (infants * infantFare);
  double tax = subtotal * 0.05;
  double service = 500;
  double total = subtotal + tax + service;

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => BillScreen(
        adults: adults,
        infants: infants,
        adultFare: adultFare,
        infantFare: infantFare,
        tax: tax,
        service: service,
        total: total,
      ),
    ),
  );
},
          child: Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${flight.sourceStationName} → ${flight.destinationStationName}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(flight.trainName, style: const TextStyle(fontSize: 13)),
                      Text(flight.trainType, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text("Status: ${flight.status}"),
                          const Spacer(),
                          Text(
                            "Available seats: ${flight.totalCoaches}",
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _flightInfo() {
    return Container(
      padding: const EdgeInsets.all(18),
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
          // Route Title
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                  "Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // From
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.grey[700]),
              const SizedBox(width: 8),
               Text(
                FlightModel.fromValue == "" ? "US" : FlightModel.fromValue,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // To
          Row(
            children: [
              Icon(Icons.flight_takeoff, color: Colors.grey[400]),
              const SizedBox(width: 8),
               Text(
                FlightModel.toValue == "" ? "PK" : FlightModel.fromValue,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 12),
          // Dates
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F9FB),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              "Wed, Mar 20  -  Mon, Mar 25",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Return and Passengers
          Row(
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
              Text(
                extraParams['adults']?.toString() ?? "2",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Icon(Icons.child_care, color: Colors.grey[500], size: 18),
              const SizedBox(width: 2),
              Text(
                extraParams['infants']?.toString() ?? "0",
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Icon(Icons.luggage, color: Colors.grey[500], size: 18),
              const SizedBox(width: 2),
              const Text("0", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> getAllFlight() async {
    try {
      final response = await HelperFucntions.getApi('http://192.168.56.1:5000/api/train/allTrains');

      if (response.statusCode == 200) {
        final allTrains = AllTrains.fromJson(jsonDecode(response.body));

        print('Flights count: ${allTrains.data.length}'); // Check parsed list length

        model.flights = allTrains.data; // Make sure you assign parsed data to your internal list

        onUpdate(); // trigger UI update
      } else {
        print('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching flights: $e');
    }
  }
}

