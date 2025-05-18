import 'package:flutter_railway_app/models/all_trains_data_model.dart';

class FlightModel {

  int selectedFilter = 0;
  

  final List<String> filters = [
    "Best",
    "Cheapest",
    "Fastest",
    "Nonstop",
  ];

  final List<Data> flights = [];

}