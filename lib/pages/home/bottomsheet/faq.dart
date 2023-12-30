import 'package:lottie/lottie.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/riwayat_provider.dart';
import 'package:simaru/themes.dart';
import 'package:simaru/widget/booking_room_card.dart';
import 'package:simaru/widget/notifikasi_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  Map<int, bool> _isExpandedMap = {};

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
                SizedBox(
                  height: 20,
                ),
                Lottie.asset(
                  'animations/faqs.json',
                  width: double.infinity,
                  height: 300,
                ),
                SizedBox(width: 8),
                Text(
                  'FAQ',
                  style: blueTextStyle.copyWith(
                    fontSize: 27,
                    fontWeight: bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ExpansionPanelList(
                      // Gunakan status ekspansi dari Map sesuai indeks panel
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
                                style: TextStyle(
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
                              style: TextStyle(
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
        return 'Siapa pengguna ruang?';
      case 1:
        return 'Untuk siapa digunakan?';
      case 2:
        return 'Buat apa?';
      default:
        return 'Pertanyaan ini belum memiliki jawaban.';
    }
  }

  String _getAnswer(int index) {
    switch (index) {
      case 0:
        return 'Jawaban untuk pertanyaan 1. Karyawan';
      case 1:
        return 'Jawaban untuk pertanyaan 2. Karyawan dan pengguna lain';
      case 2:
        return 'Jawaban untuk pertanyaan 3. Untuk memesan ruangan';
      default:
        return 'Pertanyaan ini belum memiliki jawaban.';
    }
  }
}
