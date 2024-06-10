class DetectionResponseModel {
  final String detectionClass;
  final String direction;
  final String timestamp;
  final String date;

  DetectionResponseModel({
    required this.detectionClass,
    required this.direction,
    required this.timestamp,
    required this.date,
  });

  factory DetectionResponseModel.fromJson(Map<String, dynamic> json) {
    return DetectionResponseModel(
      detectionClass: json['class'],
      direction: json['direction'],
      timestamp: json['timestamp'],
      date: json['date'],
    );
  }
}

class DetectionCountResponseModel {
  final String detectionClass;
  final int inCount;
  final int outCount;

  DetectionCountResponseModel({
    required this.detectionClass,
    required this.inCount,
    required this.outCount,
  });

  factory DetectionCountResponseModel.fromJson(String className, Map<String, dynamic> json) {
    return DetectionCountResponseModel(
      detectionClass: className,
      inCount: json['IN'],
      outCount: json['OUT'],
    );
  }
}
