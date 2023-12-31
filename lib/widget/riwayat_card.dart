import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
        DateTime.parse(riwayat.bookingDate).isBefore(DateTime.now());
 
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }

  // void _showImageDialog(BuildContext context, String imageUrl) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return Dialog(
  //         child: SizedBox(
  //           width: 500, // Sesuaikan ukuran container sesuai kebutuhan
  //           height: 500, // Sesuaikan ukuran container sesuai kebutuhan
  //           child: Image.network(
  //             imageUrl,
  //             // fit: BoxFit.cover, // Sesuaikan dengan tampilan yang Anda inginkan
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
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
