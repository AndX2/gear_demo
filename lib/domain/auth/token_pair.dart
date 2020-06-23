import 'package:flutter/foundation.dart';

@immutable
class TokenPair {
  final String accessToken;
  final String refreshToken;

  TokenPair(
    this.accessToken,
    this.refreshToken,
  );
}
