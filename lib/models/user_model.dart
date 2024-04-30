import 'member_model.dart';

class UserModel {
  int id;
  String token;
  String name;
  String email;
  String phone;
  String roles;
  String photo;
  MemberModel member;// This might be null or an AdminModel object

  UserModel({
    this.token,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.roles,
    this.photo,
    this.member,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      roles: json['roles'],
      photo: json['photo'],
      member: MemberModel.fromJson(json['member']),// It might be null or an object
    );
  }
}