import 'package:gear_demo/repository/common/transformable.dart';

class RefreshTokenRequest extends Transformable<Map<String, dynamic>> {
  final String refreshToken;

  RefreshTokenRequest(this.refreshToken);

  @override
  Map<String, dynamic> transform() {
    return {
      'refresh': refreshToken,
    };
  }
}
