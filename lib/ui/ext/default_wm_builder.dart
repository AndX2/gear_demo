import 'package:gear_demo/di/di_container.dart';

Function defaultWmBuilder<T, I>({I value}) =>
    (ctx) => getIt.get<T>(param1: ctx, param2: value);
