import 'package:flutter/material.dart';
import 'package:gear_demo/ui/common/console_message_controller.dart';
import 'package:gear_demo/ui/common/default_error_handler.dart';
import 'package:injectable/injectable.dart';
import 'package:mwwm/mwwm.dart';

@module
abstract class WmDependencyModule {
  WidgetModelDependencies getWmDependency(
    @factoryParam GlobalKey<ScaffoldState> key,
  ) {
    return WidgetModelDependencies(
      errorHandler: DefaultErrorHandler(
        ConsoleMessageController(key),
      ),
    );
  }
}
