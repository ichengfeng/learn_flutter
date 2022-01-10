import 'package:favorcate/ui/pages/home/home_drawer.dart';
import 'package:favorcate/ui/pages/main/initialize_items.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';
import 'initialize_items.dart';

class CFMainScreen extends StatefulWidget {

  static const routeName = '/';

  const CFMainScreen({Key? key}) : super(key: key);

  @override
  _CFMainScreenState createState() => _CFMainScreenState();
}

class _CFMainScreenState extends State<CFMainScreen> {

  int _currentIndex =  0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CFHomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        selectedFontSize: 14.px,
        unselectedFontSize: 14.px,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
