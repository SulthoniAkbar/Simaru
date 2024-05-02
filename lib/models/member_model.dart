import 'devision_model.dart';

class MemberModel {
  final int id;
  final int userId;
  final int divisionId;
  final String name;
  final String gender;
  final String address;
  final String nip;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt; // This might be null or a DateTime object
  // final DevisionModel division;

  MemberModel({
    this.id,
    this.userId,
    this.divisionId,
    this.name,
    this.gender,
    this.address,
    this.nip,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    // this.division,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      userId: json['user_id'],
      divisionId: json['division_id'],
      name: json['name'],
      gender: json['gender'],
      address: json['address'],
      nip: json['nip'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      // division: DevisionModel.fromJson(json['division']),
    );
  }
}
