import 'package:gear_demo/repository/list_api/list_repository.dart';
import 'package:gear_demo/service/auth/auth_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ListService {
  final ListRepository _listRepository;

  final AuthService _authService;

  final SharedPreferences _preferences;

  ListService(
    this._authService,
    this._listRepository,
    this._preferences,
  );

  void someMethod() {}
  void printConsole(String msg) {
    print('ListService.printConsole: $msg');
  }
}
