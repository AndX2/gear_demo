import 'package:flutter/foundation.dart';

//TODO: rm debug
final items = List.generate(
  30,
  (index) => Item(
    id: index,
    name: 'Батон_$index',
    description:
        'Брать только свежий',
    images: index.isOdd
        ? ['https://ideireceptov.ru/wp-content/uploads/2019/06/1-1317.jpg']
        : [],
    count: 2,
  ),
);

/// Объект позиции списка
@immutable
class Item {
  /// Id
  final int id;

  /// Название
  final String name;

  /// Примечание
  final String description;

  /// Список ссылок на изображение
  final List<String> images;

  /// Количество
  final num count;

  Item({
    this.id,
    @required this.name,
    this.description,
    this.images,
    this.count,
  });
}
