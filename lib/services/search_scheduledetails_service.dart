import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/config.dart';
import '../models/jadwal ruangan/search/search_model.dart';

class SearchScheduleDetailsService {
  Future<SearchModel> searchschedule(int id, String token) async {
    var url = '$baseUrl/rooms/schedules/$id';
    print(id);
    var headers = {
      'Content-Type': 'base/form-data',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      jsonDecode(response.body)['data']['data'];
      SearchModel searchschedule =
          SearchModel.fromJson(jsonDecode(response.body)['data']['data']);

      print(searchschedule.toString());
      return searchschedule;
    } else {
      throw Exception('Gagal');
    }
  }
}
