import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simaru/provider/auth_provider.dart';
import 'package:simaru/provider/pesan_ruang_provider.dart';
import 'package:simaru/widget/riwayat_card.dart';
import '../../themes.dart';
import '../../widget/unvailableroom_card.dart';

class UnvailbleRoomPage extends StatefulWidget {
  const UnvailbleRoomPage({Key key}) : super(key: key);

  @override
  State<UnvailbleRoomPage> createState() => _UnvailbleRoomPageState();
}

class _UnvailbleRoomPageState extends State<UnvailbleRoomPage> {
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
      elevation: 0,
      automaticallyImplyLeading: true, 
      title: const Text(
        'Ruang Rapat',
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search), 
          onPressed: () {
            Navigator.pushNamed(context, "/jadwalruang");
          },
        ),
      ],
      centerTitle: true, 
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
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (pesanruangProvider.error != null) {
              return const Center(
                child: Text('Terjadi kesalahan saat memuat data'),
              );
            } else if (pesanruangProvider.ruangan.isEmpty) {
              return Center(
                child: emptyRuangan(),
              );
            } else {
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
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: UnvailableRoomCard(
                              pesanruangProvider.ruangan[index]),
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
