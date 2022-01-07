import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CFMealItem extends StatelessWidget {
  final MealModel _meal;
  const CFMealItem(this._meal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,///阴影
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperationInfo(),
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(CFDetailScreen.routeName,arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12.px), topRight: Radius.circular(12.px),),
          child: Image.network(_meal.imageUrl,width: double.infinity,height: 250.px,fit: BoxFit.cover,),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
            // width: 300.px,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(6.px),
            ),
            child: Text(_meal.title,style: Theme.of(context).textTheme.headline2?.copyWith(color: Colors.white),),
          ),
        ),
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(16.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CFOperationItem(icon: const Icon(Icons.access_time), title: "${_meal.duration}分钟"),
          CFOperationItem(icon: const Icon(Icons.restaurant), title: _meal.complex),
          buildFavorItem(),
        ],
      ),
    );
  }

  Widget buildFavorItem() {

    return  Consumer<CFFavorViewModel>(builder: (ctx, favorVM, child){
      final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
      final favorColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
      final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏";
      return GestureDetector(
        child: CFOperationItem(
          icon: Icon(iconData, color: favorColor,),
          title: title,
          titleColor: favorColor,
        ),
        onTap: (){
          favorVM.handleMeal(_meal);
        },
      );
    });
  }

}
