import 'package:flutter/material.dart';
import 'package:learn_flutter/day09/model/user_info.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../counter_view_model.dart';
import '../user_view_model.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx)=>CFCounterViewModel(),),
  ChangeNotifierProvider(create: (ctx)=>CFUserViewModel(UserInfo('cf',20,'url')),)
];

