import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterPreferences {
  @preResolve
  Future<SharedPreferences> get preferences {
    return SharedPreferences.getInstance();
  }
}
