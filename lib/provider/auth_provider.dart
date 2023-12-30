import 'package:flutter/cupertino.dart';
import 'package:simaru/models/user_model.dart';
import 'package:simaru/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String name,
    String phone,
    String email,
    String password,
    String passwordconfirmation,
    String divisionid,
    String gender,
    String address,
    String nip,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        phone: phone,
        email: email,
        password: password,
        passwordconfirmation: passwordconfirmation,
        divisionid: divisionid,
        gender: gender,
        address: address,
        nip: nip,
      );
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout({String token}) async {
    try {
      if (token == null) {
        print('Pengguna belum login');
        return false;
      }

      await AuthService().logout(token);
      _user = null;
      return true;
    } catch (e) {
      print('Exception during logout: $e');
      return false;
    }
  }
}
