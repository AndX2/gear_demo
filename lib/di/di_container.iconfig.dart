// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:gear_demo/ui/common/console_message_controller.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:gear_demo/ui/common/default_error_handler.dart';
import 'package:gear_demo/ui/widget/list_item/list_item_wm.dart';
import 'package:gear_demo/domain/item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gear_demo/repository/shared_preferences/shared_preference_module.dart';
import 'package:gear_demo/ui/common/base_dependency_module.dart';
import 'package:mwwm/mwwm.dart';
import 'package:gear_demo/repository/list_api/list_header_builder.dart';
import 'package:dio/dio.dart';
import 'package:gear_demo/repository/dartservice_client.dart';
import 'package:gear_demo/repository/list_api/list_repository.dart';
import 'package:gear_demo/repository/auth_api/auth_repository.dart';
import 'package:gear_demo/service/auth/auth_service.dart';
import 'package:gear_demo/service/list/list_service.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final registerPreferences = _$RegisterPreferences();
  final wmDependencyModule = _$WmDependencyModule();
  final registerDartserviceClient = _$RegisterDartserviceClient();
  g.registerFactoryParam<ConsoleMessageController, GlobalKey<ScaffoldState>,
          dynamic>(
      (scaffoldKey, _) => ConsoleMessageController.create(scaffoldKey));
  g.registerFactory<DefaultErrorHandler>(
      () => DefaultErrorHandler(g<ConsoleMessageController>()));
  g.registerFactoryParam<ListItemWm, GlobalKey<ScaffoldState>, Item>(
      (key, item) => ListItemWm(key, item));
  final sharedPreferences = await registerPreferences.preferences;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerFactoryParam<WidgetModelDependencies, GlobalKey<ScaffoldState>,
      dynamic>((key, _) => wmDependencyModule.getWmDependency(key));
  g.registerFactory<ListHeaderBuilder>(
      () => ListHeaderBuilder(g<SharedPreferences>()));
  final dio = await registerDartserviceClient
      .createDartserviceClient(g<ListHeaderBuilder>());
  g.registerFactory<Dio>(() => dio, instanceName: 'dartservice');
  g.registerFactory<ListRepository>(
      () => ListRepository(g<Dio>(instanceName: 'dartservice')));
  g.registerFactory<AuthRepository>(
      () => AuthRepository(g<Dio>(instanceName: 'dartservice')));
  g.registerFactory<AuthService>(() => AuthService(g<AuthRepository>()));
  g.registerFactory<ListService>(() => ListService(
        g<AuthService>(),
        g<ListRepository>(),
        g<SharedPreferences>(),
      ));
}

class _$RegisterPreferences extends RegisterPreferences {}

class _$WmDependencyModule extends WmDependencyModule {}

class _$RegisterDartserviceClient extends RegisterDartserviceClient {}
