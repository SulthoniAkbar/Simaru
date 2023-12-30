import 'package:simaru/models/schedule_model.dart';
import 'package:simaru/services/schedule_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScheduleProvider with ChangeNotifier {
  List<ScheduleModel> _schedule = [];
  List<ScheduleModel> get schedule => _schedule;

  set schedule(List<ScheduleModel> schedule) {
    _schedule = schedule;
    notifyListeners();
  }

  Future<void> schedules(
    String token,
  ) async {
    try {
      List<ScheduleModel> schedule = await ScHeduleService().schedule(token);
      _schedule = schedule;
    } catch (e) {
      print(e);
    }
  }
}
