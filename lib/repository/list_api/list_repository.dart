import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListRepository {
  final Dio _client;

  ListRepository(@Named('dartservice') this._client);

  void someMethod() {}
}
