import 'package:simaru/models/media_model.dart';

class FeedbackModel {
  int id;
  String room_id;
  String description;
  List<MediasModel> medias;

  FeedbackModel({this.id, this.room_id, this.description, this.medias});

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    room_id = json['room_id'];
    description = json['description'];
    if (json['medias'] != null) {
      medias = List<MediasModel>();
      json['medias'].forEach((v) {
        medias.add(MediasModel.fromJson(v));
      });
    } else {
      medias = [];
    }
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room_id': room_id,
      'description': description,
      'medias': medias.map((media) => media.toJson()).toList()
    };
  }
}
