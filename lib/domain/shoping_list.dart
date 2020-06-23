import 'package:flutter/foundation.dart';
import 'package:gear_demo/domain/item.dart';

// TODO: rm debug
final lists = [
  ShoppingList(created: DateTime.now(), list: items),
  ShoppingList(name: 'Ашан',created: DateTime.now().subtract(Duration(days: 5)), list: items),
];

/// Объект списка покупок
@immutable
class ShoppingList {
  /// Дата создания списка
  final DateTime created;

  /// Название
  final String name;

  /// Список позиций
  final List<Item> list;

  ShoppingList({
    @required this.created,
    this.name,
    @required this.list,
  });
}
