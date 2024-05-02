import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/models/jadwal%20ruangan/search/search_model.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/search_unvailable_provider.dart';
import 'package:simaru/themes.dart';
import 'package:simaru/widget/listunvailableroom_card.dart';

import '../../models/pemesanan ruangan/ruangan_model.dart';

class ListUnvailableRoomPage extends StatefulWidget {
  final RuanganModel ruangan;
  const ListUnvailableRoomPage({Key key, this.ruangan}) : super(key: key);
  @override
  State<ListUnvailableRoomPage> createState() => _ListUnvailableRoomPageState();
}

class _ListUnvailableRoomPageState extends State<ListUnvailableRoomPage> {
  SearchModel search;
  @override
  void initState() {
    super.initState();
  }

  getInit() async {}

  @override
  Widget build(BuildContext context) {
    SearchUnvailableProvider searchUnvailableProvider =
        Provider.of<SearchUnvailableProvider>(context, listen: true);

    Widget header() {
      return AppBar(
        backgroundColor: bgColor1,
        centerTitle: true,
        title: Text(widget.ruangan.name),
        elevation: 0,
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          color: whiteColor,
          child: ListView.builder(
            itemCount: searchUnvailableProvider.searchunvailable.length,
            itemBuilder: (context, index) {
              return ListUnvailableRoomCard(
                  searchUnvailableProvider.searchunvailable[index]);
            },
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
