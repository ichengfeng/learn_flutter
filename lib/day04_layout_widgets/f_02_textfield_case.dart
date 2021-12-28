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
  final imageUrl = "https://ichengfeng.github.io/img/03-02.jpg";

  final userNameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextfieldDemo(userNameTextEditingController: userNameTextEditingController, passwordTextEditingController: passwordTextEditingController);
  }
}

class TextfieldDemo extends StatelessWidget {
  const TextfieldDemo({
    Key? key,
    required this.userNameTextEditingController,
    required this.passwordTextEditingController,
  }) : super(key: key);

  final TextEditingController userNameTextEditingController;
  final TextEditingController passwordTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        ///加间距
        child: Column(
          ///使里面的子内容纵向排列
          children: <Widget>[
            TextField(
              controller: userNameTextEditingController,
              decoration: InputDecoration(
                ///装饰
                labelText: "username",
                icon: const Icon(Icons.people),
                hintText: '请输入用户名',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Colors.red[100],

                ///给红色添加一个透明度，让他不那么红
              ),

              ///输入状态监听
              onChanged: (value) {
                print('onChange:$value');
              },

              ///提交状态监听
              onSubmitted: (value) {
                print('onSubmitted:$value');
              },
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: passwordTextEditingController,
              decoration: const InputDecoration(
                labelText: 'password',
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 49,
              child: TextButton(
                onPressed: () {
                  ///1、获取用户名和密码
                  final username = userNameTextEditingController.text;
                  final password = passwordTextEditingController.text;
                  print('账号：$username 密码：$password');
                },
                child: const Text(
                  '登 录',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


