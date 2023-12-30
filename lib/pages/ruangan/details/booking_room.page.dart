import 'package:simaru/models/booking_model.dart';
import 'package:simaru/models/jadwal%20ruangan/search/search_model.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/search_scheduledetails_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simaru/themes.dart';
import 'package:provider/provider.dart';

class BookingRoomPage extends StatefulWidget {
  final int roomId;

  const BookingRoomPage({Key key, this.roomId}) : super(key: key);

  @override
  State<BookingRoomPage> createState() => _BookingRoomPageState();
}

class _BookingRoomPageState extends State<BookingRoomPage> {
  int currentIndex = 0;

  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    if (widget.roomId != null) {
      await Provider.of<SearchScheduleDetailsProvider>(context, listen: false)
          .searchschedule(widget.roomId, authProvider.user.token);
    } else {
      print("Hia Objek bernilai null");
      // handling jika widget.roomId bernilai null
    }
  }

  @override
  Widget build(BuildContext context) {
    SearchModel rooms;
// BookingRoomPage(this.rooms);

    SearchScheduleDetailsProvider search =
        Provider.of<SearchScheduleDetailsProvider>(context);

    if (search.room != null) {
      print(search.room.id.toString() + 'halo');
    } else {
      print('Objek room bernilai null');
    }
    // print(search.room.id.toString() + 'halo');

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: subtitleTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Yakin',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'untuk memesan ruangan ini?',
                    style: secondaryTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/formbooking');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Pesan Sekarang',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    List images = [
      'assets/meeting-room3.jpg',
      'assets/meeting-room3.jpg',
      'assets/meeting-room3.jpg',
    ];
    Widget indicator(int index) {
      return Container(
        width: 16,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
      );
    }

    Widget header() {
      int index = -1;

      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 10,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    size: 38,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: images
                .map(
                  (image) => Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width,
                    height: 310,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
            bottom: Radius.circular(24),
          ),
          color: bgColor1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          rooms?.name ?? '',
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          rooms?.floor ?? '',
                          style: subtitleTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: semibold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Kapasitas\n${rooms?.capacity ?? ''}",
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: semibold,
                    ),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  // Text(
                  //   "Id Ruang",
                  //   // "ID Ruang: ${rooms.facilities.roomid}",
                  //   style: primaryTextStyle.copyWith(
                  //     fontSize: 10,
                  //     fontWeight: semibold,
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: subtitleTextColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Text(
                'Fasilitas',
                textAlign: TextAlign.center,
                style:
                    primaryTextStyle.copyWith(fontSize: 18, fontWeight: bold),
              ),
            ),

            //Description
            Container(
              height: 130,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
                bottom: defaultMargin,
              ),
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: subtitleTextColor,
                borderRadius: BorderRadius.circular(7),
              ),
              child: ListView(
                children: [
                  Text(
                    rooms?.facilities
                            ?.map((facility) => facility.facility.name)
                            ?.join('\n ') ??
                        '',
                    style: primaryTextStyle.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget sendButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextButton(
          onPressed: () {
            showSuccessDialog();
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(
            'Pesan',
            style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: ListView(
        children: [
          header(),
          content(),
          sendButton(),
        ],
      ),
    );
  }
}
