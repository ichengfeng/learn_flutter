import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';

class CFOperationItem extends StatelessWidget {

  const CFOperationItem({
    Key? key,
    this.titleColor = Colors.black,
    required this.icon,
    required this.title
  }) : super(key: key);

  final Widget icon;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 80.px,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 3.px,),
          Text(title, style: TextStyle(color: titleColor),),
        ],
      ),
    );
  }
}
