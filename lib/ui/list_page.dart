import 'package:flutter/material.dart';

import 'package:gear_demo/domain/item.dart';
import 'package:gear_demo/ui/widget/list_item/list_item.dart';
import 'package:gear_demo/ui/widget/list_page_header.dart';

/// Страница со списком покупок
class ListPageWidget extends StatelessWidget {
  ListPageWidget({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (_, index) => ListItemWidget(
          key: Key('listItem_$index'),
          subHeader: index == 0 ? ListPageHeaderWidget() : null,
          item: items[index],
        ),
        separatorBuilder: (_, index) => SizedBox(height: 10.0),
        padding: const EdgeInsets.only(bottom: 30.0),
      ),
    );
  }
}
