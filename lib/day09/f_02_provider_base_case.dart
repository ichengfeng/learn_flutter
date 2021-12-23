import 'package:flutter/material.dart';
import 'package:learn_flutter/day09/viewmodel/counter_view_model.dart';
import 'package:provider/provider.dart';

// main() => runApp(const MyApp());
/*
* 1、创建自己需要共享的数据
* 2、在应用程序的顶层ChangeNotifierProvider
* 3、在其他位置使用共享的数据
*    >> Provider.of:当Provider中的数据发生改变时，provider.of所在的Widget整个build方法都会重新构建
*    >> Consumer(相对推荐用法):当Provider中的数据发生改变时，执行重新执行Consumer的builder
*    >> Selector：1、selector方法（作用，对原有的数据进行转换）2、shouldRebuild(作用，要不要重新构建)
* */
void main() {
  runApp(
      ChangeNotifierProvider(
        create: (ctx)=> CFCounterViewModel(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,),
      home: const CFHomePage(),
    );
  }
}

class CFHomePage extends StatefulWidget {

  const CFHomePage({Key? key}) : super(key: key);

  @override
  State<CFHomePage> createState() => _CFHomePageState();
}

class _CFHomePageState extends State<CFHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CFShowData01(),
            CFShowData02(),
          ],
        ),
      ),
      floatingActionButton: Selector<CFCounterViewModel, CFCounterViewModel>(

        selector: (ctx, counterVM) => counterVM,
        shouldRebuild: (prev, next) => false,

        builder:(ctx, countVM, child){
          return FloatingActionButton(
            child: child,
            onPressed: (){
              countVM.counter += 1;
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CFShowData01 extends StatelessWidget {
  const CFShowData01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///3、在其他位置使用共享数据
    int counter = Provider.of<CFCounterViewModel>(context).counter;

    return Container(
      color: Colors.red,
      child: Text('当前计数：$counter',style: const TextStyle(fontSize: 30),),
    );
  }
}

class CFShowData02 extends StatelessWidget {
  const CFShowData02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Consumer<CFCounterViewModel>(
        builder: (ctx, countVM, child){
          return Text(
            '当前计数：${countVM.counter}',
            style: const TextStyle(fontSize: 30),
          );
        },
      ),
    );
  }
}
