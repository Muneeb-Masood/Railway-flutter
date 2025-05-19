class AllTrains {
  int statusCode;
  List<Data> data;

  AllTrains({
    required this.statusCode,
    required this.data,
  });

  factory AllTrains.fromJson(Map<String, dynamic> json) {
    return AllTrains(
      statusCode: json['statuscode'] ?? 0,
      data: (json['data'] as List<dynamic>)
          .map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statuscode': statusCode,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}


class Data {
  String trainId;
  String trainName;
  String trainType;
  String totalCoaches;
  String status;
  String sourceStationName;
  String destinationStationName;

  Data({
    required this.trainId,
    required this.trainName,
    required this.trainType,
    required this.totalCoaches,
    required this.status,
    required this.sourceStationName,
    required this.destinationStationName,
  });

 factory Data.fromJson(Map<String, dynamic> json) {
  return Data(
    trainId: json['train_id'].toString(),
    trainName: json['train_name'] ?? '',
    trainType: json['train_type'] ?? '',
    totalCoaches: json['total_coaches'].toString() ?? '0',
    status: json['status'] ?? '',
    sourceStationName: json['source_station_name'] ?? '',
    destinationStationName: json['destination_station_name'] ?? '',
  );
}

  Map<String, dynamic> toJson() {
    return {
      'train_id': trainId,
      'train_name': trainName,
      'train_type': trainType,
      'total_coaches': totalCoaches,
      'status': status,
      'source_station_name': sourceStationName,
      'destination_station_name': destinationStationName,
    };
  }
}
