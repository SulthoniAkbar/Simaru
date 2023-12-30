import 'package:simaru/models/schedule_model.dart';
import 'package:simaru/themes.dart';
import 'package:simaru/widget/schedule_detail_card.dart';
import 'package:flutter/material.dart';

class ScheduleDetailPage extends StatefulWidget {
  final ScheduleModel schedule;
  ScheduleDetailPage(this.schedule);

  @override
  State<ScheduleDetailPage> createState() => _ScheduleDetailPageState();
}

class _ScheduleDetailPageState extends State<ScheduleDetailPage> {
  @override
  void initState() {
    getInit();

    super.initState();
  }

  getInit() async {}

  @override
  Widget build(BuildContext context) {
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
            children: widget.schedule.bookings
                .map(
                  (bookings) => ScheduleDetailCard(bookings),
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
