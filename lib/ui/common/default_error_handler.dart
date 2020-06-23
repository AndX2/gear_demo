import 'package:gear_demo/ui/common/console_message_controller.dart';
import 'package:injectable/injectable.dart';
import 'package:mwwm/mwwm.dart';

@injectable
class DefaultErrorHandler implements ErrorHandler {
  final ConsoleMessageController _controller;

  DefaultErrorHandler(this._controller);

  @override
  void handleError(Object e) {
    _controller.show(msg: e.toString());
  }
}
