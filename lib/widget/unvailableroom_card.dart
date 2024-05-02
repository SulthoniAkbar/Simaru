import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/models/pemesanan ruangan/ruangan_model.dart';
import 'package:simaru/pages/jadwal ruang/list_unvailable_room.dart';
import 'package:simaru/provider/search_unvailable_provider.dart';
import '../provider/auth_provider.dart';
import '../themes.dart';

class UnvailableRoomCard extends StatefulWidget {
  final RuanganModel ruangan;
  const UnvailableRoomCard(this.ruangan, {Key key}) : super(key: key);

  @override
  State<UnvailableRoomCard> createState() => _UnvailableRoomCardState();
}

class _UnvailableRoomCardState extends State<UnvailableRoomCard> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    SearchUnvailableProvider searchunvailableProvider =
        Provider.of<SearchUnvailableProvider>(context);
    void handleSend() async {
      if (await searchunvailableProvider.searchunvailableroom(
        token: authProvider.user.token,
        search: widget.ruangan.name,
      )) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ListUnvailableRoomPage(ruangan: widget.ruangan),
          ),
        );
      }
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        color: lightBackgroundColor,
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    widget.ruangan.image,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nama Ruang",
                        style: blackTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.ruangan.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semibold,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 6),
                      Column(
                        children: [
                          const SizedBox(height: 6),
                          Center(
                            child: TextButton(
                              onPressed: handleSend,
                              style: TextButton.styleFrom(
                                backgroundColor: bgColor1,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: SizedBox(
                                width: 190,
                                height: 25,
                                child: Center(
                                  child: Text(
                                    'Selengkapnya',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 16,
                                      fontWeight: semibold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
