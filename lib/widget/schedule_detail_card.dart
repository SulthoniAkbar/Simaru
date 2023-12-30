import 'package:simaru/models/booking_model.dart';
import 'package:simaru/themes.dart';
import 'package:flutter/material.dart';

class ScheduleDetailCard extends StatefulWidget {
  final BookingModel schedule;
  const ScheduleDetailCard(this.schedule, {Key key}) : super(key: key);

  @override
  State<ScheduleDetailCard> createState() => _ScheduleDetailCardState();
}

class _ScheduleDetailCardState extends State<ScheduleDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        left: 5,
        right: 5,
      ),
      padding: const EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Daftar Pembooking :',
            style: primaryTextStyle3.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            widget.schedule.name,
            style: primaryTextStyle3.copyWith(
              fontSize: 14,
              fontWeight: semibold,
            ),
            maxLines: 1,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Jumlah peserta : ',
            style: primaryTextStyle3.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            widget.schedule.participant.toString(),
            style: primaryTextStyle3.copyWith(
              fontWeight: semibold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'Waktu :',
            style: primaryTextStyle3.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            "${widget.schedule.bookingStartDate} - ${widget.schedule.bookingEndDate}",
            style: primaryTextStyle3.copyWith(
              fontWeight: semibold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
