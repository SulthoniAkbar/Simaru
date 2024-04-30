import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/models/jadwal%20ruangan/search/search_model.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/search_unvailable_provider.dart';
import 'package:simaru/themes.dart';
import 'package:simaru/widget/listunvailableroom_card.dart';

class ListUnvailableRoomPage extends StatefulWidget {
  const ListUnvailableRoomPage({Key key}) : super(key: key);

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
        title: const Text('Jadwal Ruang'),
        elevation: 0,
      );
    }

    Widget content() {
      print('ini adalah booking {search.booking}');
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
