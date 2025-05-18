import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/flight/flight_screen_model_impl.dart';

class FlightResultsScreen extends StatefulWidget {
  const FlightResultsScreen({super.key});

  @override
  State<FlightResultsScreen> createState() => _FlightResultsScreenState(); 
}

class _FlightResultsScreenState extends State<FlightResultsScreen> {
  late final FlightResultsModelImpl modelImpl;

  @override
  void initState() {
    super.initState();
    modelImpl = FlightResultsModelImpl(onUpdate: () => setState(() {}));
    modelImpl.getAllFlight();
  }

  @override
  Widget build(BuildContext context) {
    return modelImpl.buildScreen(context);
  }
}

