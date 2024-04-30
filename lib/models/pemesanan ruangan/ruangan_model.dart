import 'booking_fasilitias_model.dart';

class RuanganModel {
  int id;
  String name;
  int floor;
  int capacity;
  String image;
  List<RoomFacilitiesModel> roomFacilities;

  RuanganModel({
    this.id,
    this.name,
    this.floor,
    this.capacity,
    this.image,
    this.roomFacilities,
  });

  factory RuanganModel.fromJson(Map<String, dynamic> json) {
    return RuanganModel(
      id: json['id'],
      name: json['name'],
      floor: json['floor'],
      capacity: json['capacity'],
      image: json['image'],
      roomFacilities: json['room_facilities'] != null
          ? List<RoomFacilitiesModel>.from(
              json['room_facilities'].map(
                  (facilities) => RoomFacilitiesModel.fromJson(facilities)),
            )
          : [],
    );
  }
}
