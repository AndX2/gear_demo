import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mwwm/mwwm.dart';

@injectable
class ConsoleMessageController implements MessageController {
  final GlobalKey<ScaffoldState> scaffoldKey;

  ConsoleMessageController(this.scaffoldKey);

  @factoryMethod
  static ConsoleMessageController create(
          @factoryParam GlobalKey<ScaffoldState> scaffoldKey) =>
      ConsoleMessageController(scaffoldKey);

  @override
  show({String msg, msgType}) {
    print(msg);
  }
}
