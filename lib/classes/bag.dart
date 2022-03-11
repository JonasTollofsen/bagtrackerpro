import 'package:bagtrackerpro/classes/bag_status.dart';

class Bag {
  Bag({required this.bagTagNumber, required this.bagStatus});
  int bagTagNumber;
  List<BagStatus> bagStatus;
}
