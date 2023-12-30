import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../themes.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);
  void onPressed() async {
    const String message =
        'Halo, saya ingin mendaftar dan memesan ruang rapat di Dinas Komunikasi dan Informatika Provinsi Jawa Timur.';
    const String phoneNumber = '+6289505151473';
    const String whatsApp = 'https://wa.me/$phoneNumber/?text=$message';

    await launch(whatsApp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            width: 155,
            height: 55,
            margin: const EdgeInsets.only(top: 70, bottom: 70),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splashscreen.png'),
              ),
            ),
          ),
          Text(
            'Daftar & \nPesan Ruang Rapat',
            style: whiteTextStyle.copyWith(
              fontSize: 17,
              fontWeight: semibold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              // border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Silahkan Menghubungi Admin Untuk Mendaftarkan Akun',
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      backgroundColor: blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                    ),
                    child: Text(
                      'Lanjutkan Chat Admin',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // CustomFilledButton(title: title)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account? ',
                  style: whiteTextStyle.copyWith(
                    fontSize: 12,
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                child: Text(
                  'Masuk di sini',
                  style: yellowTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
