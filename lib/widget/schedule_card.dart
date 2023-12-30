import 'package:simaru/models/schedule_model.dart';
import 'package:simaru/pages/schedule/details/schedule_detail_page.dart';
import 'package:simaru/themes.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final ScheduleModel schedule;
  const ScheduleCard(this.schedule, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScheduleDetailPage(schedule),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/home_image.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama Ruang",
                    style: primaryTextStyle3.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    schedule.name,
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
                    'Kapasitas: ',
                    style: primaryTextStyle3.copyWith(
                      fontWeight: medium,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    schedule.capacity.toString(),
                    style: primaryTextStyle3.copyWith(
                      fontWeight: semibold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    schedule.floor.toString(),
                    style: primaryTextStyle3.copyWith(
                      fontWeight: semibold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
