import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';

class CFHomeDrawer extends StatelessWidget {
  const CFHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTitle(context, const Icon(Icons.restaurant), "进餐"),
            buildListTitle(context, const Icon(Icons.settings), "过滤"),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 88.px,
      color: Colors.amber,
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('开始动手',style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold),),
      ),
    );
  }

  Widget buildListTitle(BuildContext context, Widget icon, String title) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline3,),
    );
  }
}
