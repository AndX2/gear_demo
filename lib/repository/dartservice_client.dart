import 'package:dio/dio.dart';
import 'package:gear_demo/repository/list_api/list_header_builder.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterDartserviceClient {
  @Named('dartservice')
  @preResolve
  Future<Dio> createDartserviceClient(ListHeaderBuilder headerBuilder) async {
    final options = BaseOptions(
      baseUrl: "https://dartservice.ru/api",
      connectTimeout: 10000,
      receiveTimeout: 20000,
      sendTimeout: 10000,
      headers: headerBuilder.buildHeaders(),
    );
    return Dio(options);
  }
}
