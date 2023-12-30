// class DevisionModel {
//   int id;
//   String name;

//   DevisionModel({
//     this.id,
//     this.name,
//   });

//   DevisionModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//     };
//   }
// }
class DevisionModel {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final String deletedAt;

  DevisionModel({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory DevisionModel.fromJson(Map<String, dynamic> json) {
    return DevisionModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
