import 'package:lottie/lottie.dart';

import 'package:simaru/themes.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final Map<int, bool> _isExpandedMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Lottie.asset(
                  'animations/faqs.json',
                  width: double.infinity,
                  height: 300,
                ),
                const SizedBox(width: 8),
                Text(
                  'FAQ',
                  style: blueTextStyle.copyWith(
                    fontSize: 27,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ExpansionPanelList(
                      expansionCallback: (panelIndex, isExpanded) {
                        setState(() {
                          _isExpandedMap[index] = !isExpanded;
                        });
                      },
                      children: [
                        ExpansionPanel(
                          headerBuilder: (context, isExpanded) {
                            return ListTile(
                              title: Text(
                                _getQuestion(index),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                          body: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              _getAnswer(index),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          isExpanded: _isExpandedMap.containsKey(index)
                              ? _isExpandedMap[index]
                              : false, // Set status ekspansi awal ke false jika tidak ada di Map
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getQuestion(int index) {
    switch (index) {
      case 0:
        return 'Apa itu Simaru?';
      case 1:
        return 'Bagaimana cara melakukan Pemesanan Ruang?';
      case 2:
        return 'Bagaimana cara cancel Penesanan Ruang';
      default:
        return 'Pertanyaan ini belum memiliki jawaban.';
    }
  }

  String _getAnswer(int index) {
    switch (index) {
      case 0:
        return 'Simaru adalah aplikasi Manajemen Pemesanan Ruang Rapat Dinas Komunikasi dan Informatika Provinsi Jawa Timur yang dapat digunakan untuk melakukan pemesanan ruang rapat pada kantor Dinas Komunikasi dan Informatika Provinsi Jawa Timur. ';
      case 1:
        return '- Masuk Ke Halaman Awal Aplikasi\n-Pilih “Booking Ruangan”\n- Pilih Ruangan dan pilih "Pesan"\n- Isi semua form untuk pemesanan dan jika sudah selesai maka pilih tombol pesan';
      case 2:
        return '- Masuk Ke Halaman Awal Aplikasi\n-Pilih “Riwayat Ruangan”\n- Pilih Ruangan yang akan di cancel dan batalkan pemesanan\n- Anda akan di arahkan di nomer WhatsApp Admin, isi deskripsi penyebab pembatalan ruangan dan kirim kepada admin';
      default:
        return 'Pertanyaan ini belum memiliki jawaban.';
    }
  }
}
