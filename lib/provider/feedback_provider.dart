import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:simaru/services/feedback_service.dart';
import 'package:simaru/models/feedback_model.dart';
import 'package:flutter/material.dart';

class FeedbackProvider with ChangeNotifier {
  FeedbackModel _feedback;
  String _responseBody;
  String _errorMessage;

  FeedbackModel get followup => _feedback;
  String get responseBody => _responseBody;
  String get errorMessage => _errorMessage;

  set followup(FeedbackModel followup) {
    _feedback = followup;
    notifyListeners();
  }

  Future<bool> feedback({
    String roomid,
    String description,
    List<File> mediaList, // Update parameter type to List<File>
    String token,
  }) async {
    try {
      FeedbackModel feedback = await FeedbackService().feedback(
        token: token,
        roomid: roomid,
        description: description,
        mediaList: mediaList, // Pass mediaList to the service
      );

      _feedback = feedback;
      _responseBody = feedback.toString();
      _errorMessage = null;

      return true;
    } catch (e) {
      print(e);
      _errorMessage = e.toString();
      return false;
    }
  }
}
