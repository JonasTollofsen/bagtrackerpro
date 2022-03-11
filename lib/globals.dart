import 'package:bagtrackerpro/classes/bag.dart';
import 'package:bagtrackerpro/classes/bag_status.dart';
import 'package:bagtrackerpro/classes/trip.dart';
import 'package:bagtrackerpro/classes/user.dart';

User loggedInUser = User(
  username: 'John Doe',
  trips: [
    Trip(
      startCity: 'Gothenburg',
      endCity: 'Amsterdam',
      startDate: '10 February, 2022',
      bookingNumber: 'QLBQPU',
      active: true,
      luggageStatus: LuggageStatus.ok,
      bags: [
        Bag(
          bagTagNumber: 7009453112,
          bagStatus: [
            BagStatus(
              status: 'Checked in',
              updateTime: "13:00",
              airportCode: 'GOT',
              longDescription: 'Bag is checked in',
              onTrack: true,
            )
          ],
        ),
      ],
    ),
    Trip(
      startCity: 'Amsterdam',
      endCity: 'Rio de Janeiro',
      startDate: '12 february, 2022',
      bookingNumber: 'AFBQPR',
      active: true,
      luggageStatus: LuggageStatus.warning,
      bags: [
        Bag(
          bagTagNumber: 7001462552,
          bagStatus: [
            BagStatus(
              status: 'Checked In',
              updateTime: '10:30',
              airportCode: 'GOT',
              longDescription: 'Bag is checked in',
              onTrack: true,
            ),
            BagStatus(
              status: 'Loaded',
              updateTime: '11:46',
              airportCode: 'GOT',
              longDescription: 'Your Bag has been loaded onto the aircraft',
              onTrack: true,
            ),
          ],
        ),
        Bag(
          bagStatus: [
            BagStatus(
              status: 'Checked in',
              updateTime: '11:30',
              airportCode: 'GOT',
              longDescription: 'bag is checked in yee',
              onTrack: true,
            ),
          ],
          bagTagNumber: 7001462444,
        ),
      ],
    )
  ],
);
