import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_container.iconfig.dart';

const test = const Environment('test');

final getIt = GetIt.instance;

@InjectableInit(generateForDir: ['test'])
void configureDependencies() =>
    $initGetIt(getIt, environment: Environment.test);
