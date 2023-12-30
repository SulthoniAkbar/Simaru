import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/config.dart';
import '../models/riwayat ruangan/riwayat_model.dart';

class RiwayatService {

  Future<List<RiwayatModel>> notification(String token) async {
    var url = '$baseUrl/booking';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<RiwayatModel> notif = [];

      for (var item in data) {
        notif.add(RiwayatModel.fromJson((item)));
      }
      // print(notif..toString());
      print(data);
      return notif;
    } else {
      print(response.body);
      throw Exception('Gagal get notif');
    }
  }
}
