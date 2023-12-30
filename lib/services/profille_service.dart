import 'dart:convert';
import 'package:simaru/models/user_model.dart';
import 'package:http/http.dart' as http;

import '../data/config.dart';

class ProfileService {

  Future<UserModel> profile(
      {String name,
      String phone,
      String divisionid,
      String gender,
      String address,
      String nip}) async {
    var url = '$baseUrl/profile';
    var headers = {'Content-Type': 'base/form-data'};
    var body = jsonEncode({
      'name': name,
      'phone': phone,
      'devision_id': divisionid,
      'gender': gender,
      'address': address,
      'nip': nip,
    });

    var response = await http.put(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(jsonDecode(response.body));
      Exception('Update Succes');

      return user;
    } else {
      throw Exception('Gagal Update');
    }
  }
}
