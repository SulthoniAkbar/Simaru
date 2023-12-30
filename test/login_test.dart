import 'package:flutter_test/flutter_test.dart';
import 'package:simaru/provider/auth_provider.dart';

void main() {
  group('SIMARU APP', () {
    AuthProvider authProvider;

    setUp(() {
      authProvider = AuthProvider();
    });

    test('Login Success', () async {
      final email = 'member@member.com';
      final password = 'member';

      final result = await authProvider.login(email: email, password: password);

      expect(result, true);
      expect(authProvider.user, isNotNull);
    });

    test('Login Failure Password', () async {
      final email = 'user@diskominfo.com';
      final password = 'invalidpassword';

      final result = await authProvider.login(email: email, password: password);

      expect(result, false);
      expect(authProvider.user, isNull);
    });

    test('Login Failure Email', () async {
      final email = 'asa@diskominfo.com';
      final password = '121212';

      final result = await authProvider.login(email: email, password: password);

      expect(result, false);
      expect(authProvider.user, isNull);
    });
    test('Login Failure Email & Password Null', () async {
      final email = '';
      final password = '';

      final result = await authProvider.login(email: email, password: password);

      expect(result, false);
      expect(authProvider.user, isNull);
    });
  });
}
