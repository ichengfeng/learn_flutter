import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CFHomePage(),
    );
  }
}

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础的Widget"),
      ),
      body: const CFHomeContent(),
    );
  }
}

class CFHomeContent extends StatefulWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CFHomeContentState();
  }
}

class _CFHomeContentState extends State<CFHomeContent> {

  @override
  Widget build(BuildContext context) {

    final kScreenWidth = MediaQuery.of(context).size.width;///当前屏幕宽度
    final kScreenHeight = MediaQuery.of(context).size.height;///当前屏幕高度
    print("当前屏幕宽: $kScreenWidth,高度: $kScreenHeight");

    return RowDemo2();
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textBaseline: TextBaseline.alphabetic,
        verticalDirection: VerticalDirection.down,///只对Column生效
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 80,height: 60,color: Colors.red,child: const Text('Hello',style: TextStyle(fontSize: 20),),),
          Container(width: 120,height: 100,color: Colors.green,child: const Text('world',style: TextStyle(fontSize: 30),),),
          Container(width: 90,height: 80,color: Colors.blue,child: const Text('Mike',style: TextStyle(fontSize: 12),),),
          Container(width: 50,height: 120,color: Colors.orange,child: const Text('Judy',style: TextStyle(fontSize: 40),),),
        ],
      ),
    );
  }
}

///拓展
class RowDemo2 extends StatelessWidget {
  const RowDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExpandedDemo();
  }
}

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.ideographic,
        mainAxisSize: MainAxisSize.max,
        // textDirection: TextDirection.ltr,///只对Row生效
        children: [
          /*
          * Flexible中的属性：
          * - Flex
          *Expanded -> Flixible(fit: FiexFit.tight)
          * 空间分配问题
          * 设置Flex的时候宽度具体的值不起作用，会按比例展示
          * */
          Expanded(child: Container(width: 180,height: 60,color: Colors.red,),),
          Expanded(flex: 2,child: Container(width: 120,height: 100,color: Colors.green,)),
          Container(width: 90,height: 80,color: Colors.blue,),
          Container(width: 50,height: 120,color: Colors.orange,),
        ],
      ),
    );
  }
}

/*交叉轴的使用*/
class CrossAxisAlignmentDemo1 extends StatelessWidget {
  const CrossAxisAlignmentDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*
    * CrossAxisAlignment:
    * -start: 交叉轴的起始位置对齐
    * -end: 交叉轴的结束位置对齐
    * -center:中心点对齐
    * -baseline: 基线对齐
    * -stretch: 先让row占据交叉轴尽可能大的空间，将所有的子Widget交叉轴的高度，拉伸到最大
    * */
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textBaseline: TextBaseline.ideographic,
        mainAxisSize: MainAxisSize.max,
        // textDirection: TextDirection.ltr,///只对Row生效
        children: [
          Container(width: 80,height: 60,color: Colors.red,child: const Text('Hello',style: TextStyle(fontSize: 20),),),
          Container(width: 120,height: 100,color: Colors.green,child: const Text('world',style: TextStyle(fontSize: 30),),),
          Container(width: 90,height: 80,color: Colors.blue,child: const Text('Mike',style: TextStyle(fontSize: 12),),),
          Container(width: 50,height: 120,color: Colors.orange,child: const Text('Judy',style: TextStyle(fontSize: 40),),),
        ],
      ),
    );
  }
}

/*主轴使用*/
class MainAxisAlignmentDemo extends StatelessWidget {
  const MainAxisAlignmentDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///Row/Column继承自Flex
    ///Flex: CSS Flex布局
    ///Axis.vertical 相当于Column
    ///Axis.horizontal 相当于Row
    // return Flex(direction: Axis.vertical);

    /**
     * Row的特点
     * -水平方向尽可能占据比较大的空间
     * 水平方向也希望包过内容，那么设置mainAxisSize = min
     * */

    ///主轴方向与Row或者Column排布方向一致
    ///mainAxisAlignment
    ///-start: 从主轴开始位置开始挨个摆放元素
    ///-end: 从主轴结束位置开始挨个摆放元素
    ///-center: 主轴的中心点对齐
    ///-spaceBetween: 左右两边的间距为0，其他元素之间平分间距
    ///-spaceAround: 左右两边的间距是元素间距的一半
    ///spaceEvenly: 所有间距平分

    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // textDirection: TextDirection.rtl,///right to left
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(width: 80,height: 60,color: Colors.red,),
        Container(width: 120,height: 100,color: Colors.green,),
        Container(width: 90,height: 80,color: Colors.blue,),
        Container(width: 50,height: 120,color: Colors.orange,),
      ],
    );
  }
}

class RowButtonDemo extends StatelessWidget {
  const RowButtonDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.bug_report),
          Text('bug报告'),
        ],
      ),
    );
  }
}

