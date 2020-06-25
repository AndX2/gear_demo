import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';

import 'package:gear_demo/ui/ext/default_wm_builder.dart';
import 'package:gear_demo/domain/item.dart';
import 'package:gear_demo/ui/widget/list_item/list_item_wm.dart';

/// Элемент списка покупок в виде строки виджетов
class ListItemWidget extends CoreMwwmWidget {
  final Widget subHeader;
  final Item item;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  ListItemWidget({
    this.subHeader,
    @required this.item,
  }) : super(
          widgetModelBuilder: defaultWmBuilder<ListItemWm, Item>(value: item),
        );

  @override
  WidgetState<ListItemWm> createState() {
    return ListItemState(subHeader, item);
  }
}

class ListItemState extends WidgetState<ListItemWm> {
  final Widget _subHeader;
  final Item _item;

  ListItemState(
    this._subHeader,
    this._item,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _item.id.isEven ? wm.onEvenTapAction : wm.onOddTapAction,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _subHeader ?? Container(),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  bottomLeft: const Radius.circular(30.0),
                ),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8.0)],
                color: Colors.grey[200],
              ),
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  if (_item.images.isNotEmpty) _buildImage(),
                  SizedBox(width: 12.0),
                  _buildCaptions(context),
                  _buildQty(context),
                  SizedBox(width: 8.0),
                  SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQty(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Text(
        _item.count.toString(),
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold, color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildCaptions(BuildContext context) {
    return Flexible(
      flex: 5,
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _item.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 4.0),
            Text(
              _item.description,
              style: Theme.of(context).textTheme.caption,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Flexible(
      flex: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30.0),
          bottomLeft: const Radius.circular(30.0),
        ),
        child: Image.network(
          _item.images[0],
          fit: BoxFit.cover,
          height: 70.0,
        ),
      ),
    );
  }
}
