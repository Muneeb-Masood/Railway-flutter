import 'package:flutter_railway_app/models/all_trains_data_model.dart';

class FlightModel {

  int selectedFilter = 0;
  static String fromValue = "";
  static String toValue = "";
  

  final List<String> filters = [
    "Best",
    "Cheapest",
    "Fastest",
    "Nonstop",
  ];

   List<Data> flights = [];

}