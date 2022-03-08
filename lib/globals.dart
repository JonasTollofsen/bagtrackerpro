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
      startDate: '14 aug.',
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
                airportCode: 'GOTE',
                longDescription: 'Bag is checked in mate',
                onTrack: true,
              )
            ],
            startCity: 'Gothenburg',
            endCity: 'Amsterdam,'),
      ],
    ),
    Trip(
      startCity: 'Amsterdam',
      endCity: 'Rio de Janeiro',
      startDate: '17 jun.',
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
          startCity: 'Gothenburg',
          endCity: 'Rio de Janeiro',
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
          startCity: 'Gothenburg',
          endCity: 'Rio de Janeiro',
        ),
      ],
    )
  ],
);
