import 'package:flutter/material.dart';
import 'package:simaru/models/jadwal ruangan/search/search_model.dart';
import 'package:simaru/themes.dart';

class ListUnvailableRoomCard extends StatelessWidget {
  final SearchModel search;
  const ListUnvailableRoomCard(this.search, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            search.image,
            width: 200,
            height: 221,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: search.booking.map(
                (booking) {
                  return Row(
                    children: [
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pemesanan Ruang Rapat',
                              style: primaryTextStyle3.copyWith(
                                fontSize: 12,
                                fontWeight: semibold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Nama: ",
                              style: primaryTextStyle3.copyWith(
                                fontSize: 12,
                                fontWeight: semibold,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Text(
                              booking.name,
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Penggunaan Ruangan: ",
                              style: primaryTextStyle3.copyWith(
                                fontSize: 12,
                                fontWeight: semibold,
                              ),
                            ),
                            Text(
                              '${booking.bookingStartDate} -- ${booking.bookingEndDate}',
                              style: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        children: [
                          Image.asset(
                            "assets/booked.png",
                            width: 60,
                            height: 60,
                          ),
                          const Text(
                            "Tanggal Pemesanan: ",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            booking.bookingDate,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
