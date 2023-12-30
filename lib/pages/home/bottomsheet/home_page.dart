import 'package:simaru/models/user_model.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/themes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/meeting-room1.jpg',
    'assets/meeting-room2.jpg',
    'assets/meeting-room3.jpg',
  ];

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
              'Home',
              style: blueTextStyle.copyWith(
                fontSize: 30,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Welcome Back !',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              user.name,
              style: greyTextStyle.copyWith(
                fontSize: 17,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget imageDashboard() {
      return Container(
        width: 200,
        height: 200,
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10), // Set the border radius here
          child: Image.asset(
            'assets/BoardingImage2.png.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget menuBooking() {
      return SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/pesanruang');
          },
          style: TextButton.styleFrom(
            elevation: 20,
            shadowColor: blackColor,
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'Booking Ruangan',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
          ),
        ),
      );
    }

    Widget menuJadwal() {
      return SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/jadwalruang');
          },
          style: TextButton.styleFrom(
            elevation: 20,
            shadowColor: blackColor,
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'Jadwal Ruangan',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
          ),
        ),
      );
    }

    Widget menuRiwayat() {
      return SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/riwayat');
          },
          style: TextButton.styleFrom(
            elevation: 20,
            shadowColor: blackColor,
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'Riwayat Ruangan',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
          ),
        ),
      );
    }

    Widget menuFeedback() {
      return SizedBox(
        width: double.infinity,
        height: 55,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/feedback');
          },
          style: TextButton.styleFrom(
            elevation: 20,
            shadowColor: blackColor,
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            'Keluhan Ruangan',
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
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
            imageDashboard(),
            SizedBox(
              height: 20,
            ),
            menuBooking(),
            SizedBox(
              height: 30,
            ),
            menuJadwal(),
            SizedBox(
              height: 30,
            ),
            menuRiwayat(),
            // SizedBox(
            //   height: 30,
            // ),
            // menuFeedback(),
          ],
        ),
      ),
    );
  }
}
