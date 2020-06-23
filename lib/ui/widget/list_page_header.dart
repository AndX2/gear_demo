import 'package:flutter/material.dart';

/// Виджет заголовка списка покупок
class ListPageHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Chip(
            avatar: Icon(Icons.search),
            label: Text('Поиск'),
            backgroundColor: Colors.green[100],
            
          ),
          SizedBox(width: 16.0),
          Chip(
            avatar: Icon(Icons.security),
            label: Text('Войти'),
          ),
        ],
      ),
    );
  }
}
