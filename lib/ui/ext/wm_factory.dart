import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

import 'package:gear_demo/ui/common/default_error_handler.dart';
import 'package:gear_demo/ui/ext/default_dependency_builder.dart';

class InjectableWM<T> extends WidgetModel {
  
  ErrorHandler _errorHandler;

  final BuildContext context;
  final T value;


  InjectableWM(
    this.context,
    this.value,
  ) : super(WidgetModelDependencies(errorHandler: DefaultErrorHandler(null)));

  @protected
  WidgetModelDependencies dependenciesBuilder(BuildContext context) =>
      defaultDependencyBuilder(context);

  @override
  void onLoad() {
    _errorHandler = dependenciesBuilder(context).errorHandler;
    super.onLoad();
  }

  @override
  void handleError(e) {
    _errorHandler.handleError(e);
  }
}
