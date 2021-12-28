import 'package:flutter/material.dart';
import 'package:learn_flutter/day09_state_manger/model/user_info.dart';

class CFUserViewModel extends ChangeNotifier {

  UserInfo _user;

  CFUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
  }
}