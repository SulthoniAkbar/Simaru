class RoomRiwayatModel {
  int id;
  String name;
  int floor;
  int capacity;
  String image;

  RoomRiwayatModel({
    this.id,
    this.name,
    this.floor,
    this.capacity,
    this.image,
  });

  RoomRiwayatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    floor = json['floor'];
    capacity = json['capacity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'floor': floor,
      'capacity': capacity,
      'image': image,
    };
  }
}
