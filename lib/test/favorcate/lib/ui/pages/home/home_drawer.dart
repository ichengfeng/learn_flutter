import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/shared/log.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';

class CFHomeDrawer extends StatelessWidget {
  const CFHomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: [
            buildHeaderView(context),
            buildListTitle(context, const Icon(Icons.restaurant), "进餐", (){
              Navigator.of(context).pop();
            }),
            buildListTitle(context, const Icon(Icons.settings), "过滤", (){
              Navigator.push(context, MaterialPageRoute(builder: (ctx){
                return const CFFilterScreen();
              }));
            }),
          ],
        ),
      ),
    );
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.amber,
      alignment: const Alignment(0,0.5),
      margin: EdgeInsets.only(bottom: 20.px),
      child: Text('开始动手',style: Theme.of(context).textTheme.headline1?.copyWith(fontWeight: FontWeight.bold),),
    );
  }

  Widget buildListTitle(BuildContext context, Widget icon, String title, Function() handler) {
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline3,),
      onTap: handler,
    );
  }
}
