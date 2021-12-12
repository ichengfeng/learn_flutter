import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/pages/main/initialize_items.dart';

import 'bottom_bar_item.dart';

class CFMainPage extends StatefulWidget {
  const CFMainPage({Key? key}) : super(key: key);

  @override
  _CFMainPageState createState() => _CFMainPageState();
}

class _CFMainPageState extends State<CFMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
