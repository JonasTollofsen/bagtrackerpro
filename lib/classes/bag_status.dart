class BagStatus {
  String status;
  String longDescription;
  String updateTime;
  String airportCode;
  bool onTrack = true;

  BagStatus({
    required this.status,
    required this.updateTime,
    required this.longDescription,
    required this.airportCode,
    required this.onTrack,
  });
}
