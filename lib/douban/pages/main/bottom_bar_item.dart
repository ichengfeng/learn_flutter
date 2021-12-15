import 'package:flutter/material.dart';

class CFBottomBarItem extends BottomNavigationBarItem {
  CFBottomBarItem(String iconName, String title) : super(
    label: title,
    icon: Image.asset('assets/images/tabbar/${iconName}@3x.png',width: 30, gaplessPlayback: true,),
    activeIcon: Image.asset('assets/images/tabbar/${iconName}_h@3x.png',width: 30,color: Colors.green,),
  );
}