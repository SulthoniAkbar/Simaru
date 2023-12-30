import 'objek_facility_model.dart';

class RoomFacilitiesModel {
  int roomId;
  int facilityId;
  int id;
  String quantity;
  ObjectFacilityModel facility;

  RoomFacilitiesModel({
    this.roomId,
    this.facilityId,
    this.id,
    this.quantity,
    this.facility,
  });

  factory RoomFacilitiesModel.fromJson(Map<String, dynamic> json) {
    return RoomFacilitiesModel(
      roomId: int.parse(json['room_id']),
      facilityId: int.parse(json['facility_id']),
      id: json['id'],
      quantity: json['quantity'],
      facility: ObjectFacilityModel.fromJson(json['facility']),
    );
  }
}
