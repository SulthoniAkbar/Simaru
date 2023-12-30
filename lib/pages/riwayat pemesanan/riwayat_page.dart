import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/riwayat_provider.dart';
import '../../themes.dart';
import '../../widget/riwayat_card.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({Key key}) : super(key: key);

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    await Provider.of<RiwayatProvider>(context, listen: false)
        .notifacation(authProvider.user.token);
  }

  Future<void> _refreshData() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<RiwayatProvider>(context, listen: false)
        .notifacation(authProvider.user.token);
  }

  Widget header() {
    return AppBar(
      backgroundColor: bgColor1,
      centerTitle: true,
      title: Text('Riwayat Pemesanan'),
      automaticallyImplyLeading: true,
      elevation: 0,
    );
  }

  Widget content() {
    return Container(
      color: whiteColor,
      child: RefreshIndicator(
        onRefresh: _refreshData,
        child: Consumer<RiwayatProvider>(
          builder: (context, riwayatProvider, _) {
            if (riwayatProvider.isLoading) {
              // Jika sedang loading, tampilkan indikator loading
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (riwayatProvider.error != null) {
              // Jika terjadi error saat mengambil data, tampilkan pesan error
              return Center(
                child: Text('Terjadi kesalahan saat memuat data'),
              );
            } else if (riwayatProvider.notif.isEmpty) {
              // Jika data notif kosong, tampilkan widget emptyRuangan()
              return Center(
                child: emptyRuangan(),
              );
            } else {
              // Jika data notif tersedia, tampilkan daftar notif
              return SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height -
                        Scaffold.of(context).appBarMaxHeight,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: riwayatProvider.notif.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: RiwayatCard(riwayatProvider.notif[index]),
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
