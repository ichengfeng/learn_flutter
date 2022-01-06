import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';

class CFOperationItem extends StatelessWidget {

  const CFOperationItem(
      this._icon,
      this._title,
      {Key? key}
      ) : super(key: key);

  final Widget _icon;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(width: 3.px,),
        Text(_title, style: Theme.of(context).textTheme.bodyText2,),
      ],
    );
  }
}
