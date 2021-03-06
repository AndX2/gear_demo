import 'package:gear_demo/domain/auth/token_pair.dart';
import 'package:gear_demo/repository/auth_api/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthService {
  final AuthRepository _authRepository;

  AuthService(
    this._authRepository,
  );

  void someMethod() {}

  Future<TokenPair> refreshToken(String refreshToken) {
    return _authRepository.refreshAccessToken(refreshToken);
  }
}
