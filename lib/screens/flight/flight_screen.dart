import 'package:flutter/widgets.dart';
import 'package:flutter_railway_app/screens/flight/flight_screen_model_impl.dart';

class FlightResultsScreen extends StatefulWidget {
  const FlightResultsScreen({super.key});

  @override
  State<FlightResultsScreen> createState() => _FlightResultsScreenState();
}

class _FlightResultsScreenState extends State<FlightResultsScreen> {
  late final FlightResultsModelImpl modelImpl;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)!.settings.arguments;
    final Map<String, dynamic> data = args as Map<String, dynamic>;

    modelImpl = FlightResultsModelImpl(
      onUpdate: () => setState(() {}),
      extraParams: data,
    );

    modelImpl.getAllFlight();
  }

  @override
  Widget build(BuildContext context) {
    return modelImpl.buildScreen(context);
  }
}
