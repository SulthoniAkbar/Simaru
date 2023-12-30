import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simaru/models/pemesanan%20ruangan/ruangan_model.dart';

import '../data/config.dart';

class PemesananRoomService {
  Future<List<RuanganModel>> bookingroom(int id, String token) async {
    var url = '$baseUrl/rooms';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      "Accept": "application/json"
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<RuanganModel> ruangan = [];

      for (var item in data) {
        ruangan.add(RuanganModel.fromJson((item)));
      }
      print(data);
      return ruangan;
    } else {
      print(response.body);
      throw Exception('Gagal get notif');
    }
  }
}
