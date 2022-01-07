import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';

class CFDetailContent extends StatelessWidget {

  final MealModel meal;

  const CFDetailContent(this.meal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, '制作材料'),
          buildMakeMaterial(context),
          buildMakeTitle(context, '制作步骤'),
          buildMakeSteps(context),
          SizedBox(height: Screen.bottomHeight),
        ],
      ),
    );
  }

  //1、横幅照片
  Widget buildBannerImage() {
    return SizedBox(
      width: double.infinity,
      child: Image.network(meal.imageUrl,),
    );
  }

  //2、制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meal.ingredients.length,
        itemBuilder: (ctx,index) {
          return Card(
            color: Theme.of(context).colorScheme.secondary,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10),
              child: Text(meal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }

  //3、制作步骤
  Widget buildMakeSteps(BuildContext context) {
    return buildMakeContent(
      context: context,
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: meal.steps.length,
        itemBuilder: (ctx,index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Text("${index+1}",style: const TextStyle(color: Colors.white),),
            ),
            title: Text(meal.steps[index]),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
      ),
    );
  }

  //公共方法
  Widget buildMakeTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Text(title,style: Theme.of(context).textTheme.headline2?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget buildMakeContent({required BuildContext context, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.px),
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
