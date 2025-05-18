class AllTrains{
  int statusCode;
  Data data;

  AllTrains(
    this.statusCode,
    this.data
  );
  factory AllTrains.fromJson(Map<String, dynamic> json) {
    return AllTrains(
      json['statusCode'],
      Data.fromJson(json['data']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'data': data.toJson(),
    };
  }
}


class Data {
  String trainId;
  String trainName;
  String trainType;
  int totalCoaches;
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
      trainId: json['trainId'],
      trainName: json['trainName'],
      trainType: json['trainType'],
      totalCoaches: json['totalCoaches'],
      status: json['status'],
      sourceStationName: json['sourceStationName'],
      destinationStationName: json['destinationStationName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'trainId': trainId,
      'trainName': trainName,
      'trainType': trainType,
      'totalCoaches': totalCoaches,
      'status': status,
      'sourceStationName': sourceStationName,
      'destinationStationName': destinationStationName,
    };
  }
}