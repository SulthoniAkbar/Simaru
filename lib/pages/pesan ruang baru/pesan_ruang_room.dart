import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/pesan_ruang_provider.dart';
import 'package:simaru/widget/riwayat_card.dart';
import '../../themes.dart';
import '../../widget/booking_room_card.dart';

class PesanRuangPage extends StatefulWidget {
  const PesanRuangPage({Key key}) : super(key: key);

  @override
  State<PesanRuangPage> createState() => _PesanRuangPageState();
}

class _PesanRuangPageState extends State<PesanRuangPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    await Provider.of<PesanRuangProvider>(context, listen: false)
        .bookingroom(null, authProvider.user.token);
  }

  Future<void> _refreshData() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<PesanRuangProvider>(context, listen: false)
        .bookingroom(null, authProvider.user.token);
  }

  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      title: const Text('Ruang Rapat'),
      automaticallyImplyLeading: true,
      elevation: 0,
    );
  }

  Widget content() {
    return Container(
      color: whiteColor,
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: Consumer<PesanRuangProvider>(
          builder: (context, pesanruangProvider, _) {
            if (pesanruangProvider.isLoading) {
              // Jika sedang loading, tampilkan indikator loading
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (pesanruangProvider.error != null) {
              // Jika terjadi error saat mengambil data, tampilkan pesan error
              return const Center(
                child: Text('Terjadi kesalahan saat memuat data'),
              );
            } else if (pesanruangProvider.ruangan.isEmpty) {
              // Jika data notif kosong, tampilkan widget emptyRuangan()
              return Center(
                child: emptyRuangan(),
              );
            } else {
              // Jika data notif tersedia, tampilkan daftar notif
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        Scaffold.of(context).appBarMaxHeight,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: pesanruangProvider.ruangan.length,
                      itemBuilder: (context, index) {
                        final reversedIndex =
                            pesanruangProvider.ruangan.length - index - 1;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: BookingRoomCard(
                              pesanruangProvider.ruangan[reversedIndex]),
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(),
      body: Column(
        children: [
          Expanded(
            child: content(),
          ),
        ],
      ),
    );
  }
}
