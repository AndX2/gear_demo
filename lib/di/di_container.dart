import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:gear_demo/di/di_container.iconfig.dart';

final getIt = GetIt.instance;

@InjectableInit(generateForDir: ['lib'])
void configureDependencies() => $initGetIt(getIt);
