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
  const CFHomePage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: const Text("基础的Widget"),
      ),
      body: const CFHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: ()=>print('FloatingActionButton clicked'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CFHomeContent extends StatefulWidget {
  const CFHomeContent({
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CFHomeContentState();
  }
}

class _CFHomeContentState extends State<CFHomeContent> {

  final imageUrl = "https://ichengfeng.github.io/img/03-02.jpg";

  @override
  Widget build(BuildContext context) {
    return const ButtonDemo();
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(//对应之前的RaisedButton
          child: const Text('ElevatedButton',style: TextStyle(color: Colors.red),),
          style: ButtonStyle(
            // textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.red)),
              backgroundColor: MaterialStateProperty.all(Colors.grey)
          ),
          onPressed: (){
            print('ElevatedButton clicked');
          },
        ),
        TextButton(//对应之前的FlatButton
          child: const Text('TextButton'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange),
          ),
          onPressed: (){
            print('TextButton clicked');
          },
        ),
        OutlinedButton(
          child: const Text('OutlineButton'),
          onPressed: (){
            print("OutlineButton clicked");
          },
        ),
        TextButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Icon(Icons.favorite,color: Colors.red,),
              Text('自定义Button')
            ],
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amberAccent),
              // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),//指定半价圆角
              shape: MaterialStateProperty.all(const StadiumBorder())//设置圆角
          ),
          onPressed: (){},
        )
      ],
    );
  }
}
