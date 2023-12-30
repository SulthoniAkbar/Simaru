// import 'package:simaru/models/booking_model.dart';
// import 'package:simaru/pages/pesan ruang/details/booking_room.page.dart';
// import 'package:simaru/themes.dart';
// import 'package:flutter/material.dart';
// import '../models/jadwal ruangan/search/search_model.dart';

// class BookingCard extends StatelessWidget {
//   final SearchModel booking;
//   BookingCard(this.booking);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => BookingRoomPage(
//               roomId: this.booking.id,
//             ),
//             // builder: (context) => BookingRoomPage(),
//           ),
//         );
//       },
//       child: Container(
//         margin: EdgeInsets.only(
//           top: 20,
//           left: 5,
//           right: 5,
//         ),
//         padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(12),
//             color: whiteColor,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3), // changes position of shadow
//               ),
//             ]),
//         child: Row(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 'assets/home_image.png',
//                 width: 120,
//                 height: 120,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(
//               width: 12,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Nama Ruang:',
//                     style: primaryTextStyle3.copyWith(
//                       fontSize: 12,
//                       fontWeight: medium,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     booking.name,
//                     style: primaryTextStyle3.copyWith(
//                       fontSize: 14,
//                       fontWeight: semibold,
//                     ),
//                     maxLines: 1,
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     'Kapasitas: ',
//                     style: primaryTextStyle3.copyWith(
//                       fontWeight: medium,
//                       fontSize: 12,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     '120',
//                     style: primaryTextStyle3.copyWith(
//                       fontWeight: semibold,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
