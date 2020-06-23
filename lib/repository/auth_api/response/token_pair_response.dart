import 'package:gear_demo/domain/auth/token_pair.dart';

class TokenPairMapper {
  String accessToken;
  String refreshToken;
  TokenPairMapper.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  TokenPair map() {
    return TokenPair(accessToken, refreshToken);
  }
}
