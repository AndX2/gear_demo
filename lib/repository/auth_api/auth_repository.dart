import 'package:dio/dio.dart';
import 'package:gear_demo/domain/auth/token_pair.dart';
import 'package:gear_demo/repository/auth_api/request/refresh_token_request.dart';
import 'package:gear_demo/repository/auth_api/response/token_pair_response.dart';
import 'package:gear_demo/repository/ulr.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthRepository {
  final Dio _client;

  AuthRepository(@Named('dartservice') this._client);

  void someMethod() {}

  Future<TokenPair> refreshAccessToken(String refreshToken) {
    return _client
        .post(AuthUrl.refreshToken,
            data: RefreshTokenRequest(refreshToken).transform())
        .then(
          (response) => TokenPairMapper.fromJson(response.data).map(),
        );
  }
}
