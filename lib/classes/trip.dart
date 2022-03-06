import 'bag.dart';

class Trip {
  String startCity;
  String endCity;
  String startAirport;
  String endAirport;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  String bookingNumber;
  String lastUpdateTime;
  String lastUpdateDate;
  String updateName;
  String airCraftNumber;
  List<Bag> bags;
  bool? active = true;

  Trip({
    required this.startCity,
    required this.endCity,
    required this.startAirport,
    required this.endAirport,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
    required this.bookingNumber,
    required this.lastUpdateDate,
    required this.lastUpdateTime,
    required this.updateName,
    required this.airCraftNumber,
    required this.bags,
    this.active,
  });
}
