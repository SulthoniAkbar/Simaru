import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/models/user_model.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/themes.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget profile() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Akun Saya',
              style: blackTextStyle.copyWith(
                fontSize: 25,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget imageProfile() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon_username.png',
            width: 100,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            user.name,
            style: blackTextStyle.copyWith(
              fontSize: 15,
              fontWeight: semibold,
            ),
          )
        ],
      );
    }

    Widget menuUbahAkun() {
      return SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/editprofile');
          },
          style: TextButton.styleFrom(
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.edit,
                color: blackColor,
              ),
              SizedBox(width: 30),
              Text(
                'Ubah Akun',
                style: blackTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget menuLogout() {
      return SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          onPressed: () async {
            AuthProvider authProvider =
                Provider.of<AuthProvider>(context, listen: false);
            if (authProvider.user.token != null) {
              try {
                await authProvider.logout(token: authProvider.user.token);
                // Jika logout berhasil, Anda dapat melakukan navigasi ke halaman login atau halaman lain yang sesuai.
                // Misalnya, kembali ke halaman login:
                Navigator.pushReplacementNamed(context, '/sign-in');
              } catch (e) {
                // Tangani kegagalan logout jika diperlukan
                print('Logout gagal: $e');
                // Anda dapat menampilkan pesan kesalahan atau tindakan lain sesuai kebutuhan.
              }
            } else {
              print('Pengguna belum login');
            }
          },
          style: TextButton.styleFrom(
            shadowColor: Colors.black,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.logout,
                color: blackColor,
              ),
              SizedBox(width: 30),
              Text(
                'Keluar Akun',
                style: blackTextStyle.copyWith(
                  fontSize: 17,
                  fontWeight: semibold,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 30), // Tambahkan padding di sini
        child: ListView(
          children: [
            profile(),
            SizedBox(
              height: 50,
            ),
            imageProfile(),
            SizedBox(
              height: 40,
            ),
            // menuUbahAkun(),
            // SizedBox(
            //   height: 30,
            // ),
            menuLogout(),
          ],
        ),
      ),
    );
  }
}
