import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data/config.dart';
import '../models/jadwal ruangan/search/search_model.dart';

class SearchUnvailableService {
  Future<List<SearchModel>> searchunvailableroom({
    String search,
    String token,
  }) async {
    var url = '$baseUrl/rooms/search-unavailable';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var body = jsonEncode({
      'search': search,
    });
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    print('Request body: $body');

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      List<SearchModel> searchunvailable = [];

      for (var item in data) {
        searchunvailable.add(SearchModel.fromJson(item));
      }
      print(searchunvailable);
      return searchunvailable;
    } else {
      print(response.body);
      throw Exception('Failed Search');
    }
  }
}