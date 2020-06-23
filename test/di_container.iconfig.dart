// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'service/auth_service_test.dart';
import 'package:gear_demo/repository/auth_api/auth_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  //Register test Dependencies --------
  if (environment == 'test') {
    g.registerFactory<AuthRepository>(() => AuthRepositoryMock());
  }
}
