class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String nip;
  String token;
  String address;
  String devisi;
  String gender;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.nip,
      this.token,
      this.devisi,
      this.gender});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nip = json['nip'];
    address = json['address'];
    devisi = json['division_id'];
    gender = json['gender'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nip': nip,
      'address': address,
      'email': email,
      'devisi': devisi,
      'gender': gender,
      'phone': phone,
      'token': token,
    };
  }
}
