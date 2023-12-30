import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simaru/models/devision_model.dart';

import '../data/config.dart';
import '../models/riwayat ruangan/riwayat_model.dart';

class DevisionService {
  Future<List<DevisionModel>> devisi(String token) async {
    var url = '$baseUrl/divisions';
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
      List data = jsonDecode(response.body)['data'];
      List<DevisionModel> devisi = [];

      for (var item in data) {
        devisi.add(DevisionModel.fromJson((item)));
      }
      // print(notif..toString());
      print(data);
      return devisi;
    } else {
      print(response.body);
      throw Exception('Gagal get notif');
    }
  }
}
