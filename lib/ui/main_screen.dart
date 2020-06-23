import 'package:flutter/material.dart';
import 'package:gear_demo/ui/list_page.dart';
import 'package:gear_demo/ui/widget/shift_menu.dart';
import 'package:gear_demo/res/colors.dart' as colors;

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundColor,
      body: ShiftMenu(
        closedMenu: List.generate(
          4,
          (index) => Text(
            'title $index',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[100]),
          ),
        ),
        openedMenu: List.generate(
          4,
          (index) => Text(
            'title $index',
            style: TextStyle(fontSize: 16.0, color: Colors.grey[100]),
          ),
        ),
        content: [
          Container(
            color: Colors.brown[200],
            child: ListPageWidget(key: UniqueKey()),
          ),
          Container(
            color: Colors.yellow[200],
            child: ListPageWidget(key: UniqueKey()),
          ),
          Container(
            color: Colors.blue[200],
            child: ListPageWidget(key: UniqueKey()),
          ),
          Container(
            color: Colors.red[200],
            child: ListPageWidget(key: UniqueKey()),
          ),
        ],
        contentCardColor: Colors.grey[100],
      ),
    );
  }
}
