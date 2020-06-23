import 'package:flutter/material.dart';
import 'package:gear_demo/di/di_container.dart';
import 'package:gear_demo/ui/main_screen.dart';
import 'package:injectable/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

// @injectable
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Список покупок',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      //TODO: удалить после реализации именованных маршрутов
      home: MainScreen(),
    );
  }
}
