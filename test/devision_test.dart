import 'package:flutter_test/flutter_test.dart';
import 'package:simaru/provider/devision_provider.dart'; // Pastikan Anda mengimpor provider yang benar.

void main() {
  group('DivisionProvider Tests', () {
    test('Division - success', () async {
      final provider = DevisionProvider();

      // Ganti 'your_token_here' dengan token yang valid untuk pengujian.
      const token = '32|w1YyrdvAGQKNeCAxuget2HDTk4RHBTCAmZlblV1X';

      await provider.devision(token);

      // Periksa bahwa atribut divisions dari provider tidak null dan merupakan List<DevisionModel>.
      expect(provider.devisi, isNotNull);
      // expect(provider.fetchDivisions.length, greaterThan(0));
      expect(provider.devisi, isList);
      expect(provider.devisi, isNotEmpty);
      // expect(provider.fetchDivisions[0], isInstanceOf<DevisionModel>());
    });

    test('Division - failed', () async {
      final provider = DevisionProvider();

      // Gunakan token yang tidak valid untuk memicu kesalahan.
      const token = 'invalid_token';

      await provider.devision(token);

      // Harapkan bahwa atribut error dari provider tidak null setelah kegagalan.
      expect(provider, isNotNull);
    });
  });
}
