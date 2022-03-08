import 'bag.dart';

enum LuggageStatus { ok, warning, reported }

class Trip {
  String startCity;
  String endCity;
  String startDate;
  String bookingNumber;
  List<Bag> bags;
  bool? active = true;
  LuggageStatus? luggageStatus = LuggageStatus.ok;

  Trip({
    required this.startCity,
    required this.endCity,
    required this.startDate,
    required this.bookingNumber,
    required this.bags,
    this.active,
    this.luggageStatus,
  });
}
