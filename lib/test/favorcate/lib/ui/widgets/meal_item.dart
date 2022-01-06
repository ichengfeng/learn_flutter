import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:favorcate/ui/widgets/operation_item.dart';
import 'package:flutter/material.dart';

class CFMealItem extends StatelessWidget {
  final MealModel _meal;
  const CFMealItem(this._meal,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.px),
      elevation: 5,///阴影
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
      child: Column(
        children: [
          buildBasicInfo(context),
          buildOperationInfo(),
        ],
      ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CFOperationItem(const Icon(Icons.access_time), "${_meal.duration}分钟"),
          CFOperationItem(const Icon(Icons.restaurant), _meal.complex),
          const CFOperationItem(Icon(Icons.favorite_outline), "未收藏"),
        ],
      ),
    );
  }
}
