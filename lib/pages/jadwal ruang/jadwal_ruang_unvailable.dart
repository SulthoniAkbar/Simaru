import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/search_room_provider.dart';
import 'package:simaru/provider/search_unvailable_provider.dart';
import 'package:simaru/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class JadwalRuangUnvailablePage extends StatefulWidget {
  const JadwalRuangUnvailablePage({Key key}) : super(key: key);

  @override
  State<JadwalRuangUnvailablePage> createState() => _JadwalRuangUnvailablePageState();
}

class _JadwalRuangUnvailablePageState extends State<JadwalRuangUnvailablePage> {
  TextEditingController nameRoomController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    SearchUnvailableProvider searchUnvailableProvider = Provider.of<SearchUnvailableProvider>(context);

    handleSend() async {
      if (await searchUnvailableProvider.searchunvailableroom(
        token: authProvider.user.token,
        search: nameRoomController.text,
      ));{
            Navigator.pushNamed(context, '/searchlistjadwal');
          }
    }

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: const Text('Jadwal Ruang'),
        elevation: 0,
      );
    }

    Widget startBookingInput() {
      return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Email Input
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: nameRoomController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          contentPadding: EdgeInsets.all(12),
                        ),
                      ),
                    ],
                  ),],
      );
    }

   
    Widget sendButton() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          height: 50,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: TextButton(
            onPressed: handleSend,
            style: TextButton.styleFrom(
              backgroundColor: bgColor1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(
              'Cari',
              style:
                  primaryTextStyle.copyWith(fontSize: 18, fontWeight: medium),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: header(),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              startBookingInput(),
              sendButton(),
            ],
          ),
        ));
  }
}
