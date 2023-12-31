import 'package:simaru/pages/home/bottomsheet/faq.dart';
import 'package:simaru/pages/home/main_page.dart';
import 'package:simaru/pages/jadwal%20ruang/jadwal_ruang.dart';
import 'package:simaru/pages/jadwal%20ruang/list_jadwal_ruang.dart';
import 'package:simaru/pages/pesan%20ruang%20baru/pesan_ruang_room.dart';
import 'package:simaru/pages/profile/edit_profile_page.dart';
import 'package:simaru/pages/riwayat%20pemesanan/riwayat_page.dart';
import 'package:simaru/pages/ruangan/booking_page.dart';
import 'package:simaru/pages/ruangan/details/booking_room.page.dart';
import 'package:simaru/pages/schedule/schedule_page.dart';
import 'package:simaru/pages/signIn_page.dart';
import 'package:simaru/pages/signUp_page.dart';
import 'package:simaru/pages/splashscreen_page.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/booking_room_provider.dart';
import 'package:simaru/provider/devision_provider.dart';
import 'package:simaru/provider/feedback_provider.dart';
import 'package:simaru/provider/pesan_ruang_provider.dart';
import 'package:simaru/provider/riwayat_provider.dart';
import 'package:simaru/provider/schedule_provider.dart';
import 'package:simaru/provider/search_room_provider.dart';
import 'package:simaru/provider/search_scheduledetails_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/keluhan ruang/feedback_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FeedbackProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DevisionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RiwayatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingRoomProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchScheduleDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PesanRuangProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/sign-in': (context) =>const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => MainPage(),
          '/faq': (context) => FaqPage(),
          '/riwayat': (context) => const RiwayatPage(),
          '/editprofile': (context) => EditProfilePage(),
          '/feedback': (context) => const FeedbackPage(),
          '/booking': (context) => BookingPage(),
          '/jadwalruang': (context) => JadwalRuangPage(),
          '/listjadwalruang': (context) => ListJadwalRuang(),
          '/pesanruang': (context) => const PesanRuangPage(),
          '/bookingroom': (context) => const BookingRoomPage(),
          '/schedule': (context) => SchedulePage(),
          // '/formbooking': (context) => FormBookingPage(),
        },
      ),
    );
  }
}
