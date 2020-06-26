import 'package:flutter/material.dart' hide Action;
import 'package:injectable/injectable.dart';
import 'package:relation/relation.dart';

import 'package:gear_demo/di/di_container.dart';
import 'package:gear_demo/domain/item.dart';
import 'package:gear_demo/service/list/list_service.dart';
import 'package:gear_demo/ui/ext/wm_factory.dart';

@injectable
class ListItemWm extends InjectableWM<Item> {
  final onOddTapAction = Action();
  final onEvenTapAction = Action();

  ListItemWm(
    @factoryParam BuildContext context,
    @factoryParam Item value,
  ) : super(context, value);

  @override
  void onLoad() {
    super.onLoad();
  }

  @override
  void onBind() {
    super.onBind();

    subscribe(onOddTapAction.stream, (_) => _onTap());
    subscribe(onEvenTapAction.stream, (_) => _onEvenTap());
  }

  void _onTap() {
    handleError('Handle error message ${value.name}');
  }

  void _onEvenTap() {
    final listService = getIt.get<ListService>();
    listService.printConsole(value.name);
  }
}
