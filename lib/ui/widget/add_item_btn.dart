import 'package:flutter/material.dart';

/// Виджет кнопки Добавить позицию списка
class AddItemBtnWidget extends StatelessWidget {
  const AddItemBtnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 60.0,
      child: Material(
        color: Colors.green.withOpacity(.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
          ),
          splashColor: Colors.blue,
          onTap: () => print('tap'),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
