// import 'package:simaru/models/user_model.dart';
// import 'package:simaru/provider/auth_provider.dart';
// import 'package:simaru/provider/booking_room_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:simaru/themes.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class FormBookingPage extends StatefulWidget {
//   @override
//   State<FormBookingPage> createState() => _FormBookingPagePageState();
// }

// class _FormBookingPagePageState extends State<FormBookingPage> {
//   DateTime startdate;
//   DateTime enddate;
//   TextEditingController startDateController = TextEditingController(text: '');
//   TextEditingController endDateController = TextEditingController(text: '');
//   TextEditingController nameController = TextEditingController(text: '');
//   TextEditingController phoneController = TextEditingController(text: '');
//   TextEditingController devisionController =
//       TextEditingController(text: ''.toString());
//   TextEditingController descriptionController = TextEditingController(text: '');
//   TextEditingController addressController = TextEditingController(text: '');
//   TextEditingController nipController = TextEditingController(text: '');
//   TextEditingController partcipantController = TextEditingController(text: '');
//   TextEditingController roomidController = TextEditingController(text: '');

//   @override
//   Widget build(BuildContext context) {
//     AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     UserModel user = authProvider.user;
//     BookingRoomProvider bookingRoomProvider =
//         Provider.of<BookingRoomProvider>(context);

//     handleSend() async {
//       startdate = startDateController.text.isNotEmpty
//           ? DateTime.parse(startDateController.text)
//           : null;
//       enddate = endDateController.text.isNotEmpty
//           ? DateTime.parse(endDateController.text)
//           : null;

//       if (await bookingRoomProvider.bookingsRoom(
//         token: authProvider.user.token,
//         name: nameController.text,
//         participant: partcipantController.text,
//         roomid: roomidController.text,
//         description: descriptionController.text,
//         nip: nipController.text,
//         phone: phoneController.text,
//         startDate: startdate == null
//             ? null
//             : DateFormat("yyyy-MM-dd kk:mm:ss").format(startdate),
//         endDate: enddate == null
//             ? null
//             : DateFormat("yyyy-MM-dd kk:mm:ss").format(enddate),
//       )) {
//         Navigator.pushNamed(context, '/home');
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: alertColor,
//             content: Text(
//               'Gagal Booking',
//               textAlign: TextAlign.center,
//             ),
//           ),
//         );
//       }
//     }

//     Widget header() {
//       return AppBar(
//         backgroundColor: bgColor1,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           'Pemesanan Ruang Rapat',
//         ),
//       );
//     }

//     Widget nameInput() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Nama',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 40,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: nameController,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: user.name,
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget devisi() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Devisi',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 40,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: devisionController,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: user.devisi.toString(),
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget nip() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'NIP',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 40,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: nipController,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: user.address,
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget phone() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Phone Number',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 40,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: phoneController,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: user.phone,
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget startDate() {
//       return Container(
//           margin: EdgeInsets.only(
//             top: 30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Tanggal Mulai',
//                 style: primaryTextStyle3.copyWith(
//                   fontSize: 14,
//                   fontWeight: medium,
//                 ),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               Container(
//                 height: 40,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: primaryTextColor,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   controller: startDateController,
//                   onTap: () {
//                     DatePicker.showDateTimePicker(context,
//                         theme: DatePickerTheme(
//                           containerHeight: 210.0,
//                         ),
//                         showTitleActions: true, onConfirm: (date) {
//                       print(date);
//                       String formattedDate =
//                           DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
//                       startDateController.text = formattedDate;
//                     }, currentTime: DateTime.now(), locale: LocaleType.id);
//                   },
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: defaultMargin, vertical: 10)),
//                 ),
//               ),
//             ],
//           ));
//     }

//     Widget endDate() {
//       return Container(
//           margin: EdgeInsets.only(
//             top: 30,
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Tanggal Mulai',
//                 style: primaryTextStyle3.copyWith(
//                   fontSize: 14,
//                   fontWeight: medium,
//                 ),
//               ),
//               SizedBox(
//                 height: 12,
//               ),
//               Container(
//                 height: 40,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: primaryTextColor,
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: TextField(
//                   controller: endDateController,
//                   onTap: () {
//                     DatePicker.showDateTimePicker(context,
//                         theme: DatePickerTheme(
//                           containerHeight: 210.0,
//                         ),
//                         showTitleActions: true, onConfirm: (date) {
//                       print(date);
//                       String formattedDate =
//                           DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
//                       endDateController.text = formattedDate;
//                     }, currentTime: DateTime.now(), locale: LocaleType.id);
//                   },
//                   decoration: InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(
//                           horizontal: defaultMargin, vertical: 10)),
//                 ),
//               ),
//             ],
//           ));
//     }
//     //   return Container(
//     //     margin: EdgeInsets.only(
//     //       top: 30,
//     //     ),
//     //     child: Column(
//     //       crossAxisAlignment: CrossAxisAlignment.start,
//     //       children: [
//     //         Text(
//     //           'Tanggal Mulai',
//     //           style: primaryTextStyle3.copyWith(
//     //             fontSize: 14,
//     //             fontWeight: medium,
//     //           ),
//     //         ),
//     //         SizedBox(
//     //           height: 12,
//     //         ),
//     //         Container(
//     //           height: 40,
//     //           width: double.infinity,
//     //           decoration: BoxDecoration(
//     //             color: primaryTextColor,
//     //             borderRadius: BorderRadius.circular(12),
//     //           ),
//     //           child: TextField(
//     //             controller: endDateController,
//     //             onTap: () {
//     //               DatePicker.showDateTimePicker(context,
//     //                   theme: DatePickerTheme(
//     //                     containerHeight: 210.0,
//     //                   ),
//     //                   showTitleActions: true, onConfirm: (date) {
//     //                 print(date);
//     //                 String formattedDate =
//     //                     DateFormat("yyyy-MM-dd kk:mm").format(date);
//     //                 endDateController.text = formattedDate;
//     //               }, currentTime: DateTime.now(), locale: LocaleType.id);
//     //             },
//     //             decoration: InputDecoration(
//     //                 border: InputBorder.none,
//     //                 contentPadding: EdgeInsets.symmetric(
//     //                     horizontal: defaultMargin, vertical: 10)),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   );
//     // }

//     Widget participant() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Participant',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 40,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: partcipantController,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Jumlah Participant',
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget roomid() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Room ID',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 40,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: roomidController,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Jumlah Participant',
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget activity() {
//       return Container(
//         margin: EdgeInsets.only(
//           top: 30,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Kegiatan',
//               style: primaryTextStyle3.copyWith(
//                 fontSize: 14,
//                 fontWeight: medium,
//               ),
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Container(
//               height: 120,
//               padding: EdgeInsets.symmetric(
//                 horizontal: 16,
//                 vertical: 7,
//               ),
//               decoration: BoxDecoration(
//                 color: primaryTextColor,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: TextFormField(
//                 controller: descriptionController,
//                 maxLines: 12,
//                 maxLength: 100,
//                 style: primaryTextStyle3,
//                 decoration: InputDecoration.collapsed(
//                   hintText: 'Kegiatan yang akan dilakukan',
//                   hintStyle: subtitleTextStyle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     Widget sendButton() {
//       return Container(
//         height: 50,
//         width: double.infinity,
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: TextButton(
//           onPressed: handleSend,
//           // Navigator.pushNamed(context, '/listruang');
//           style: TextButton.styleFrom(
//             backgroundColor: primaryColor,
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           ),
//           child: Text(
//             'Cari',
//             style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
//           ),
//         ),
//       );
//     }

//     Widget content() {
//       return Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(
//           horizontal: defaultMargin,
//         ),
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             nameInput(),
//             devisi(),
//             nip(),
//             phone(),
//             participant(),
//             activity(),
//             roomid(),
//             startDate(),
//             endDate(),
//             sendButton(),
//           ],
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: header(),
//       body: content(),
//       resizeToAvoidBottomInset: false,
//     );
//   }
// }
