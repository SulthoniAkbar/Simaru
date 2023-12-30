class FacilityModel {
  int id;
  String name;

  FacilityModel({
    this.id,
    this.name,
  });

  FacilityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
