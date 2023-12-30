import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/config.dart';
import '../models/jadwal ruangan/search/search_model.dart';

class RoomServices {
  Future<SearchModel> room(int id, String token) async {
    var url = '$baseUrl/rooms/$id';

    var headers = {
      'Content-Type': 'base/form-data',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body.toString());

    if (response.statusCode == 200) {
      SearchModel room =
          SearchModel.fromJson(jsonDecode(response.body)['data']);
      print('${room.id}dari service');
      return room;
    } else {
      throw Exception('Gagal');
    }
  }
}
