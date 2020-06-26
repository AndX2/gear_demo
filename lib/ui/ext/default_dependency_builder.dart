import 'package:flutter/material.dart';
import 'package:gear_demo/ui/common/console_message_controller.dart';
import 'package:gear_demo/ui/common/default_error_handler.dart';
import 'package:mwwm/mwwm.dart';

final Function defaultDependencyBuilder =
    (BuildContext context) => WidgetModelDependencies(
          errorHandler: DefaultErrorHandler(
            ConsoleMessageController(Scaffold.of(context).widget.key),
          ),
        );
