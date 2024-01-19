import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:simaru/models/user_model.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/riwayat ruangan/riwayat_model.dart';
import '../pages/keluhan ruang/feedback_page.dart';
import '../themes.dart';

class RiwayatCard extends StatelessWidget {
  final RiwayatModel riwayat;
  const RiwayatCard(this.riwayat, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Menentukan warna teks berdasarkan nilai riwayat.status
    Color statusColor;
    TextStyle statusTextStyle;
    if (riwayat.status == "DONE") {
      statusColor = Colors.green; // Warna teks hijau untuk DONE
      statusTextStyle = primaryTextStyle3.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: statusColor,
      );
    } else if (riwayat.status == "PENDING") {
      statusColor = Colors.yellow; // Warna teks kuning untuk PENDING
      statusTextStyle = primaryTextStyle3.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: statusColor,
      );
    } else if (riwayat.status == "CANCELED") {
      statusColor = Colors.red; // Warna teks merah untuk CANCELED
      statusTextStyle = primaryTextStyle3.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: statusColor,
      );
    } else {
      statusTextStyle = primaryTextStyle3.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
    }

    bool showReviewButton = riwayat.status == "DONE" &&
        DateTime.now().isAfter(DateTime.parse(riwayat.bookingEndDate));

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    riwayat.room.image,
                    height: 70,
                    width: 70,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pemesanan Ruang Rapat',
                        style: secondaryTextStyle.copyWith(fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        riwayat.room.name,
                        style: primaryTextStyle3.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        riwayat.status,
                        style: statusTextStyle,
                      ),
                      Text(
                        riwayat.bookingDate.toString(),
                        style: subtitleTextStyle.copyWith(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(2),
                        child: showReviewButton
                            ? TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          FeedbackPage(idRoom: riwayat.idRoom),
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: greenColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Beri Ulasan',
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: semibold,
                                  ),
                                ),
                              )
                            : Container(),
                      ),
                      // Tombol Batal Pemesanan
                      if (showReviewButton = riwayat.status == "PENDING" ||
                          riwayat.status == "DONE" &&
                              !showReviewButton &&
                              DateTime.now().isBefore(
                                DateTime.parse(riwayat.bookingEndDate),
                              ))
                        Container(
                          margin: const EdgeInsets.all(2),
                          child: TextButton(
                            onPressed: () {
                              String message =
                                  // "Saya ${riwayat.name} Akan membatalkan pemesanan ${riwayat.room.name} pada tanggal ${riwayat.bookingDate} jam ${riwayat.bookingStartDate} - ${riwayat.bookingEndDate}.";
                                  "Hai Admin Dinas Komunikasi dan Infromatika Provinsi Jawa Timur. Mohon Maaf Saya Berencana akan membatalkan Pemesanan Ruang Rapat, dengan deskripsi senagai berikut: \n\n Nama Pemesanan:\n ${riwayat.name}\n Ruangan:\n ${riwayat.room.name}\n Tanggal Pemesanan:\n ${riwayat.bookingDate}\n Jam Pelaksanaan Rapat:\n ${riwayat.bookingStartDate} sampai dengan ${riwayat.bookingEndDate}\n Deskripsi Pembatalan:\n..........  \n\n\n\n Noted: Untuk Pembatalan Ruangan Tolong isikan Deskripsi Penyebab Pembatalan Rapat Diatas ini(Hapus ...... dengan deskripsi pembatalan).";
                              String whatsApp =
                                  "https://wa.me/6289505151473?text=${Uri.encodeComponent(message)}";
                              launch(whatsApp);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Colors.red, // Sesuaikan warna batal pemesanan
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              'Batal Pemesanan',
                              style: whiteTextStyle.copyWith(
                                fontSize: 10,
                                fontWeight: semibold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget emptyRuangan() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'animations/tidakadanotif.json',
          width: 250,
          height: 250,
        ),
        const SizedBox(height: 10),
        Text(
          'Kamu Belum Memiliki Ruangan',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Silahkan Untuk Hubungi Admin',
          style: greyTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
