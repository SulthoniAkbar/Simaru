import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/booking_room_provider.dart';
import 'package:simaru/themes.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

import '../../models/user_model.dart';

class FormPesanRuanganPage extends StatefulWidget {
  final int idRoom;

  const FormPesanRuanganPage({Key key, this.idRoom}) : super(key: key);

  @override
  State<FormPesanRuanganPage> createState() => _FormPesanRuanganPagePageState();
}

class _FormPesanRuanganPagePageState extends State<FormPesanRuanganPage> {
  UserModel userModel;
  String selectedFilePath;
  DateTime startdate;
  DateTime enddate;
  TextEditingController startDateController = TextEditingController(text: '');
  TextEditingController endDateController = TextEditingController(text: '');
  // TextEditingController nameController = TextEditingController(text: '');
  TextEditingController descriptionController = TextEditingController(text: '');
  TextEditingController partcipantInternalController =
      TextEditingController(text: '');
  TextEditingController partcipantExternalController =
      TextEditingController(text: '');
  // TextEditingController phoneController = TextEditingController(text: '');
  // TextEditingController nipController = TextEditingController(text: '');
  // TextEditingController partcipantController = TextEditingController(text: '');
  String _radioValue = 'INTERNAL';

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;
      if (_radioValue == 'INTERNAL') {
        partcipantInternalController.text = '';
        partcipantExternalController.text = '0';
      } else if (_radioValue == 'EXTERNAL') {
        partcipantInternalController.text = '0';
        partcipantExternalController.text = '';
      } else if (_radioValue == 'INTERNAL & EXTERNAL') {
        partcipantInternalController.text = '';
        partcipantExternalController.text = '';
      }
    });
  }

  Future<void> _pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String fileType = result.files.single.extension;
      print('Jenis Berkas yang Dipilih: $fileType');
      print('Selected File Path: $selectedFilePath');

      List<String> allowedFileTypes = [
        'jpg',
        'png',
        'jpeg',
        'pdf',
        'doc',
        'docx',
        'xls',
        'xlsx',
        'ppt',
        'pptx'
      ];

      if (!allowedFileTypes.contains(fileType.toLowerCase())) {
        if (kDebugMode) {
          print('Error: Jenis Berkas Tidak Diizinkan');
        }
        return;
      }

      setState(() {
        selectedFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    BookingRoomProvider bookingRoomProvider =
        Provider.of<BookingRoomProvider>(context);

    handleSend() async {
      startdate = startDateController.text.isNotEmpty
          ? DateTime.parse(startDateController.text)
          : null;
      enddate = endDateController.text.isNotEmpty
          ? DateTime.parse(endDateController.text)
          : null;

      final formattedStartDate = startdate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss").format(startdate)
          : null;
      final formattedEndDate = enddate != null
          ? DateFormat("yyyy-MM-dd HH:mm:ss").format(enddate)
          : null;

      if (await bookingRoomProvider.bookingRoom(
        token: authProvider.user.token,
        name: authProvider.user.name,
        participantExternal: partcipantExternalController.text,
        participantInternal: partcipantInternalController.text,
        roomid: widget.idRoom,
        description: descriptionController.text,
        nip: authProvider.user.member.nip,
        phone: authProvider.user.phone,
        startDate: formattedStartDate,
        endDate: formattedEndDate,
        participanttype: _radioValue,
        attachment: selectedFilePath,
      )) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const SizedBox.shrink(),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'animations/done.json',
                    width: 120,
                    height: 120,
                  ),
                  Text(
                    'Sukses',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text('Ruangan Rapat Berhasil Dibooking.'),
                ],
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, '/home');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: bgColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const SizedBox.shrink(),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'animations/failed.json',
                    width: 120,
                    height: 120,
                  ),
                  Text(
                    'Pemesanan Gagal',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text('Silahkan Isi Data Dengan Benar.'),
                ],
              ),
              actions: [
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: bgColor1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(56),
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: const Text(
          'Pemesanan Ruang Rapat',
        ),
      );
    }

    Widget startDate() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Waktu Awal Pemesanan',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: startDateController,
            onTap: () {
              DatePicker.showDateTimePicker(context,
                  theme: const DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  showTitleActions: true, onConfirm: (date) {
                if (kDebugMode) {
                  print(date);
                }
                String formattedDate =
                    DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
                startDateController.text = formattedDate;
              }, currentTime: DateTime.now(), locale: LocaleType.id);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      );
    }

    Widget endDate() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Waktu Akhir Pemesanan',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: endDateController,
            onTap: () {
              DatePicker.showDateTimePicker(context,
                  theme: const DatePickerTheme(
                    containerHeight: 210.0,
                  ),
                  showTitleActions: true, onConfirm: (date) {
                if (kDebugMode) {
                  print(date);
                }
                String formattedDate =
                    DateFormat("yyyy-MM-dd HH:mm:ss").format(date);
                endDateController.text = formattedDate;
              }, currentTime: DateTime.now(), locale: LocaleType.id);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      );
    }

    Widget participantInternal() {
      return Visibility(
        visible:
            _radioValue != 'INTERNAL & EXTERNAL' && _radioValue != 'EXTERNAL',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Participant',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: partcipantInternalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      );
    }

    Widget participantExternal() {
      return Visibility(
        visible:
            _radioValue != 'INTERNAL & EXTERNAL' && _radioValue != 'INTERNAL',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jumlah Participant',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: partcipantExternalController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                contentPadding: const EdgeInsets.all(12),
              ),
            ),
          ],
        ),
      );
    }

    Widget participantInternalExternal() {
      return Visibility(
        visible: _radioValue == 'INTERNAL & EXTERNAL',
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Participant Internal',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: partcipantInternalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Participant External',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: partcipantExternalController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      contentPadding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget activity() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Kegiatan',
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              contentPadding: const EdgeInsets.all(12),
            ),
          ),
        ],
      );
    }

    Widget radioButtons() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              'Pilih Jenis Peserta',
              style: blackTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
          ),
          Row(
            children: [
              Radio(
                value: 'INTERNAL',
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                'INTERNAL',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              Radio(
                value: 'EXTERNAL',
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                'EXTERNAL',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
              ),
              Radio(
                value: 'INTERNAL & EXTERNAL',
                groupValue: _radioValue,
                onChanged: _handleRadioValueChange,
              ),
              Text(
                'INTERNAL &\n EXTERNAL',
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget sendButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextButton(
          onPressed: handleSend,
          style: TextButton.styleFrom(
            backgroundColor: bgColor1,
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

    Widget attachment() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, // Warna border dapat disesuaikan
                width: 1, // Lebar border dapat disesuaikan
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                  8), // Sesuaikan jarak antara border dan isi
              child: InkWell(
                onTap: _pickFile,
                child: Row(
                  children: const [
                    Icon(Icons.attach_file, size: 30),
                    SizedBox(width: 20),
                    Text('Tambah File'),
                  ],
                ),
              ),
            ),
          ),
          if (selectedFilePath != null) Text(selectedFilePath),
        ],
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              radioButtons(),
              participantInternal(),
              participantExternal(),
              participantInternalExternal(),
              activity(),
              startDate(),
              endDate(),
              const SizedBox(height: 20),
              attachment(),
              sendButton(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: header(),
      body: content(),
      resizeToAvoidBottomInset: true,
    );
  }
}
