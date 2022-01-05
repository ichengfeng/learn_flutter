import 'package:flutter/material.dart';
import 'package:favorcate/ui/pages/home/home.dart';
import 'package:favorcate/ui/pages/favor/favor.dart';

final List<Widget> pages = [
  const CFHomeScreen(),
  const CFFavorScreen(),
];

final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: '首页'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: '收藏'
  ),
];