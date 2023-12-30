import 'dart:convert';
import 'dart:io';
import 'package:simaru/models/feedback_model.dart';
import 'package:http/http.dart' as http;

import '../data/config.dart';

class FeedbackService {
  Future<FeedbackModel> feedback({
    String roomid,
    String description,
    List<File> mediaList,
    String token,
  }) async {
    var url = '$baseUrl/feedbacks';
    var headers = {
      'Authorization': 'Bearer $token',
      "Accept":
          "application/json" // Simplified the way to include the token in the header
    };

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.fields['room_id'] = roomid;
    request.fields['description'] = description;

    if (mediaList != null && mediaList.isNotEmpty) {
      for (int i = 0; i < mediaList.length; i++) {
        var media = mediaList[i];
        var fileStream = http.ByteStream(Stream.castFrom(media.openRead()));
        var length = await media.length();

        var multipartFile = http.MultipartFile(
          'medias[]', // Use the key 'medias[]' to match the server's expectation for an array
          fileStream,
          length,
          filename: media.path.split('/').last,
        );
        request.files.add(multipartFile);
      }
    }

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      FeedbackModel feedback = FeedbackModel.fromJson(data);

      return feedback;
    } else {
      print(response.body);
      throw Exception('Feedback Failed');
    }
  }
}
