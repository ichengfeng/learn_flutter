import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/home/home.dart';
import 'package:learn_flutter/douban/pages/mall/mall.dart';
import 'package:learn_flutter/douban/pages/mine/mine.dart';
import 'package:learn_flutter/douban/pages/video/video.dart';

import 'bottom_bar_item.dart';

List<CFBottomBarItem> items = [
  CFBottomBarItem('wifi','首页'),
  CFBottomBarItem('video', '影音'),
  CFBottomBarItem('search', '集市'),
  CFBottomBarItem('game', '我的'),
];

List<Widget> pages = [
  const CFHomePage(),
  const CFVideoPage(),
  const CFMallPage(),
  const CFMinePage(),
];