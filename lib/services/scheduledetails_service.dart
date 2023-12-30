import 'dart:convert';
import 'package:simaru/models/schedule_model.dart';
import 'package:http/http.dart' as http;

import '../data/config.dart';

class ScheduleDetailsService {
  Future<ScheduleModel> schedule(int id, String token) async {
    var url = '$baseUrl/rooms/schedules/$id';
    var headers = {'Content-Type': 'base/form-data'};

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body)['data']['data'];
      ScheduleModel schedule =
          ScheduleModel.fromJson(jsonDecode(response.body)['data']['data']);

      print(schedule.toString());
      return schedule;
    } else {
      throw Exception('Gagal get notif');
    }
  }
}
