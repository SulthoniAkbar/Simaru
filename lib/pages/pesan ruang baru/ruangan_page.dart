import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/models/pemesanan%20ruangan/ruangan_model.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/pesan_ruang_provider.dart';
import 'package:simaru/themes.dart';

class RoomPage extends StatefulWidget {
  final int roomId;

  const RoomPage({Key key, this.roomId}) : super(key: key);

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  RuanganModel rooms;

  @override
  void initState() {
    super.initState();
    getRoomsData();
  }

  void getRoomsData() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    PesanRuangProvider pesanRuangProvider =
        Provider.of<PesanRuangProvider>(context, listen: false);

    if (widget.roomId != null) {
      await pesanRuangProvider.bookingroom(
          widget.roomId, authProvider.user.token);
    }

    rooms = pesanRuangProvider.ruangan.firstWhere(
        (ruangan) => ruangan.id == widget.roomId,
        orElse: () => null);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details Ruang Rapat'),
        backgroundColor: bgColor1,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                rooms != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          rooms.image,
                          width: 270,
                          height: 239,
                          fit: BoxFit.cover,
                        ),
                      )
                    : const CircularProgressIndicator(), // Tampilkan indikator loading jika rooms masih null
                const SizedBox(height: 20),
                Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Nama Ruang:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          rooms != null ? rooms.name : 'Loading...',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Lantai:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          rooms != null ? rooms.floor.toString() : 'Loading...',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Kapasitas:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          rooms != null
                              ? rooms.capacity.toString()
                              : 'Loading...',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Fasilitas:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        rooms != null
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: rooms.roomFacilities.length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    rooms.roomFacilities[index].facility.name,
                                    style: const TextStyle(fontSize: 16),
                                  );
                                },
                              )
                            : const CircularProgressIndicator(), // Tampilkan indikator loading jika rooms masih null
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
