import 'package:flutter_test/flutter_test.dart' as unit_test;

import 'package:gear_demo/domain/auth/token_pair.dart';
import 'package:gear_demo/repository/auth_api/auth_repository.dart';
import 'package:gear_demo/service/auth/auth_service.dart';
import 'package:injectable/injectable.dart';

import '../di_container.dart' as di;

final _testRefreshToken = 'hajsdfjhvasdjhfv';
final _testNewRefreshToken = 'hajsdfjhvasdjhfv';
final _testNewAccessToken = 'hajsdfjhvasdjhfv';

@di.test
@Injectable(as: AuthRepository, env: Environment.test)
class AuthRepositoryMock implements AuthRepository {
  @override
  Future<TokenPair> refreshAccessToken(String refreshToken) async {
    if (refreshToken == _testRefreshToken) {
      await Future.delayed(Duration(milliseconds: 2000));
      return TokenPair(_testNewAccessToken, _testNewRefreshToken);
    }
    throw Exception('wrong refresh token');
  }

  @override
  void someMethod() {}
}

main() { 

  unit_test.setUpAll(
    () {
      di.configureDependencies();
      unit_test.TestWidgetsFlutterBinding.ensureInitialized();
    },
  );

  testRefreshToken();
}

void testRefreshToken() {
  unit_test.test(
    'Обновление истекшего токена доступа',
    () async {
      AuthService service = AuthService(di.getIt<AuthRepository>());
      
      final pair = await service.refreshToken(_testRefreshToken);
      assert(pair != null && pair is TokenPair,
          'Ошибка логики AuthService.refreshToken');
      print(pair.accessToken);
    },
  );
}
