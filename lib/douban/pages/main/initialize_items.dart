import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/home/home.dart';
import 'package:learn_flutter/douban/pages/subject/subject.dart';

import 'bottom_bar_item.dart';

List<CFBottomBarItem> items = [
  CFBottomBarItem('wifi','首页'),
  CFBottomBarItem('video', '影音'),
  CFBottomBarItem('search', '集市'),
  CFBottomBarItem('game', '我的'),
];

List<Widget> pages = [
  CFHomePage(),
  CFSubjectPage(),
  CFHomePage(),
  CFHomePage(),
];