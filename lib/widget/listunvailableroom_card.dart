import 'package:flutter/material.dart';
import 'package:simaru/models/jadwal ruangan/search/search_model.dart';

class ListUnvailableRoomCard extends StatelessWidget {
  final SearchModel search;
  const ListUnvailableRoomCard(this.search, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: search.booking.map((booking) {
            return Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    booking.attachment,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pemesanan Ruang Rapat',
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        booking.name,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        booking.status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  booking.bookingDate.toString(),
                  style: TextStyle(fontSize: 10),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
