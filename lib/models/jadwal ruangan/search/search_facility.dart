import 'package:simaru/models/facilty_model.dart';

class SearchFacilitiesModel {
  int id;
  String quantity;
  String roomid;
  FacilityModel facility;

  SearchFacilitiesModel({
    this.id,
    this.roomid,
    this.quantity,
    this.facility,
  });

  SearchFacilitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roomid = json['room_id'];
    quantity = json['quantity'];
    facility = FacilityModel.fromJson(json['facility']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'room_id': roomid,
      'facility': facility.toJson(),
    };
  }
}
