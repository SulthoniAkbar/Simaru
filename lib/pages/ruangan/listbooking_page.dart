// import 'package:simaru/provider/auth_provider.dart';
// import 'package:simaru/provider/search_room_provider.dart';
// import 'package:simaru/themes.dart';
// import 'package:simaru/widget/booking_card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ListBooking extends StatefulWidget {
//   @override
//   State<ListBooking> createState() => _ListBookingState();
// }

// class _ListBookingState extends State<ListBooking> {
//   @override
//   void initState() {
//     getInit();
//     super.initState();
//   }

//   getInit() async {}

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider =
//         Provider.of<AuthProvider>(context, listen: false);
//     SearchProvider searchProvider =
//         Provider.of<SearchProvider>(context, listen: false);

//     Widget header() {
//       return AppBar(
//         backgroundColor: bgColor1,
//         centerTitle: true,
//         title: Text('Booking Ruang'),
//         elevation: 0,
//       );
//     }

//     Widget content() {
//       return Expanded(
//         child: Container(
//           color: whiteColor,
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             children: searchProvider.search
//                 .map(
//                   (search) => BookingCard(search),
//                 )
//                 .toList(),
//           ),
//         ),
//       );
//     }

//     return Column(
//       children: [
//         header(),
//         content(),
//       ],
//     );
//   }
// }
