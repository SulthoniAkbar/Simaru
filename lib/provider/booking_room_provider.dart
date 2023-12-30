import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/booking_room_model.dart';
import '../services/booking_service.dart';

class BookingRoomProvider with ChangeNotifier {
  List<BookingRoomModel> _bookingroom = [];
  List<BookingRoomModel> get bookingroom => _bookingroom;

  Future<bool> bookingRoom({
    String name,
    String nip,
    int roomid,
    int devision,
    String phone,
    String description,
    String participant,
    String startDate,
    String endDate,
    String attachment,
    String participanttype,
    String token,
  }) async {
    try {
      BookingRoomModel booking = await BookingService().booking(
        token: token,
        startdate: startDate,
        enddate: endDate,
        participanttype: participanttype,
        roomid: roomid,
        name: name,
        nip: nip,
        attachment: attachment,
        description: description,
        participant: participant,
        devision: devision,
        phone: phone,
      );

      _bookingroom = [booking]; // Tambahkan booking ke dalam list _bookingroom
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
