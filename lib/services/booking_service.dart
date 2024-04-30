import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:simaru/data/config.dart';
import 'package:simaru/models/booking_room_model.dart';

class BookingService {
  Future<BookingRoomModel> booking({
    String startdate,
    String enddate,
    String token,
    String name,
    String nip,
    String phone,
    int devision,
    int roomid,
    String participantInternal,
    String participantExternal,
    String participanttype,
    String attachment,
    String description,
  }) async {
    var url = '$baseUrl/booking';
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..headers.addAll(headers)
      ..fields['start_date'] = startdate
      ..fields['end_date'] = enddate
      ..fields['name'] = name
      ..fields['room_id'] = roomid.toString()
      ..fields['division_id'] = devision?.toString() ?? ''
      ..fields['nip'] = nip
      ..fields['phone'] = phone
      ..fields['description'] = description
      ..fields['participant_internal'] =
          participantInternal.isNotEmpty ? participantInternal : '0'
      ..fields['participant_external'] =
          participantExternal.isNotEmpty ? participantExternal : '0'
      ..fields['participant_type'] = participanttype;

    // Tambahkan kondisi untuk menghindari attachment null
    if (attachment != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'attachment',
        attachment,
        contentType: MediaType(
            'application', 'pdf'), // Sesuaikan dengan jenis file yang sesuai
      ));
    }

    var response = await http.Response.fromStream(await request.send());

    if (kDebugMode) {
      print(response.body);
    }

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        BookingRoomModel booking = BookingRoomModel.fromJson(data);
        return booking;
      } else {
        if (kDebugMode) {
          print('Error in booking: ${response.request}');
        }
        if (kDebugMode) {
          print('Error in booking: ${response.headers}');
        }
        if (kDebugMode) {
          print('Error in booking: ${response.statusCode}');
        }
        if (kDebugMode) {
          print('Response body: ${response.body}');
        }
        throw Exception('Gagal Booking');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in booking: $e');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }

      if (e is Exception) {
        if (kDebugMode) {
          print('Error message: ${e.toString()}');
        }
      } else {
        if (kDebugMode) {
          print('Error message is not available');
        }
      }

      throw Exception('Gagal Booking');
    }
  }
}
