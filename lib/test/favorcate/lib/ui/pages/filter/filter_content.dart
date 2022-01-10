import 'package:favorcate/ui/shared/log.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';

class CFFilterContent extends StatelessWidget {
  const CFFilterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiceTitle(context),
        buildChoiceSelect(),
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        '展示你的选择',
        style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<CFFilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            children: [
              buildListTitle('无谷蛋白', '无谷蛋白', filterVM.isGlutenFree, (value){
                filterVM.isGlutenFree = value;
              }),
              buildListTitle('不含乳糖', '不含乳糖', filterVM.isLactoseFree, (value){
                filterVM.isLactoseFree = value;
              }),
              buildListTitle('素食主义', '素食主义', filterVM.isVegetarian, (value){
                filterVM.isVegetarian = value;
              }),
              buildListTitle('严格素食主义', '严格素食主义', filterVM.isVegan, (value){
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTitle(String title, String subTitle, bool value, Function(dynamic value) onChange) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(
        value: value,
        onChanged: onChange,
      ),
    );
  }
}
