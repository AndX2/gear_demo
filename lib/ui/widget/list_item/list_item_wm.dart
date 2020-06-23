import 'package:flutter/material.dart' hide Action;
import 'package:injectable/injectable.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

import 'package:gear_demo/di/di_container.dart';
import 'package:gear_demo/domain/item.dart';
import 'package:gear_demo/service/list/list_service.dart';
import 'package:gear_demo/ui/common/console_message_controller.dart';
import 'package:gear_demo/ui/common/default_error_handler.dart';

@injectable
class ListItemWm extends WidgetModel {
  final Item item;
  final GlobalKey<ScaffoldState> key;

  final onOddTapAction = Action<void>();
  final onEvenTapAction = Action<void>();

  ListItemWm(
    @factoryParam this.key,
    @factoryParam this.item,
  ) : super(
          WidgetModelDependencies(
            errorHandler: DefaultErrorHandler(
              ConsoleMessageController(key),
            ),
          ),
        );

  @override
  void onLoad() {
    super.onLoad();
  }

  @override
  void onBind() {
    super.onBind();
    subscribe<void>(onOddTapAction.stream, _onTap);
    subscribe<void>(onEvenTapAction.stream, _onEvenTap);
  }

  void _onTap(_) {
    handleError('Handle error message ${item.name}');
  }

  void _onEvenTap(_) {
    final listService = getIt.get<ListService>();
    listService.printConsole(item.name);
  }
}
