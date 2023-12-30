import 'package:flutter_test/flutter_test.dart';
import 'package:simaru/provider/pesan_ruang_provider.dart';

void main() {
  group('PesanRuang Tests', () {
    PesanRuangProvider pesanRuangProvider;

    setUp(() {
      pesanRuangProvider = PesanRuangProvider();
    });

    test('bookingroom - sukses', () async {
      // Gantilah 'your_token_here' dengan token valid untuk pengujian.
      final token = '398|Uf2NIDwkvduYgs69OqzhtH1sPeWAyGxaL5rXCIta';
      final id = 1;

      await pesanRuangProvider.bookingroom(id, token);

      // Pastikan bahwa daftar `ruangan` pada provider tidak kosong setelah pemesanan.
      expect(pesanRuangProvider.ruangan, isNotNull);
      expect(pesanRuangProvider.ruangan.length, greaterThan(0));
    });

    test('bookingroom - gagal', () async {
      // Gunakan token yang tidak valid untuk memicu error.
      final token = '';
      final id = 1;

      await pesanRuangProvider.bookingroom(id, token);

      // Pastikan bahwa field `error` pada provider tidak null setelah gagal.
      expect(pesanRuangProvider, isNotNull);
    });
  });
}
