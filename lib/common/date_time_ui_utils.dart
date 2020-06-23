import 'package:intl/intl.dart';

/// Расширение для вывода даты и времени
extension DateTimeUiExt on DateTime {
  static final formatddMmYy = DateFormat.yMMMEd();
  String formatDdMmYy() => formatddMmYy.format(this);
}
