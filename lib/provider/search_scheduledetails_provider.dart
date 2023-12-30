import 'package:simaru/services/room_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/jadwal ruangan/search/search_model.dart';

class SearchScheduleDetailsProvider with ChangeNotifier {
  SearchModel _room;

  SearchModel get room => _room;

  set room(SearchModel room) {
    _room = room;
    notifyListeners();
  }

  Future<bool> searchschedule(int id, String token) async {
    try {
      SearchModel room = await RoomServices().room(id, token);
      _room = room;
      print(_room.id.toString() + 'dari provider');
    } catch (e) {
      print(e);
    }
  }
}
