import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/search_room_provider.dart';
import 'package:simaru/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/widget/jadwalruang_card.dart';

class ListJadwalRuang extends StatefulWidget {
  @override
  State<ListJadwalRuang> createState() => _ListJadwalRuangState();
}

class _ListJadwalRuangState extends State<ListJadwalRuang> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {}

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    SearchProvider searchProvider =
        Provider.of<SearchProvider>(context, listen: false);

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text('Jadwal Ruang'),
        elevation: 0,
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: whiteColor,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: searchProvider.search
                .map(
                  (search) => JadwalRuangCard(search),
                )
                .toList(),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
