import 'package:flutter/material.dart';
import 'package:learn_flutter/day12_animation/pages/image_detail.dart';
import 'package:learn_flutter/day12_animation/pages/model_pages.dart';

main() => runApp(const MyApp());

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

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 16/9,
          ),
          children: List.generate(20, (index) {
            final imageURL = 'https://picsum.photos/500/500?random=$index';
            return GestureDetector(
              onTap: () => jumpToImageDetailPage(context, imageURL),
              child: Hero(
                tag: imageURL,
                child: Image.network(
                  imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pageRouteBuilder(context),
        child: const Icon(Icons.pool),
      ),
    );
  }

  void presentModelVC(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext ctx){
        return const CFModelPage();
      },
      fullscreenDialog: true,//present model推出页面
    ));
  }

  void pageRouteBuilder(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 2),
        pageBuilder: (ctx, animation1,animation2){
          return FadeTransition(
            opacity: animation1,
            child: const CFModelPage(),
          );
        }),
    );
  }

  ///跳转到图片详情页
  void jumpToImageDetailPage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(PageRouteBuilder(
      // transitionDuration: const Duration(seconds: 1),
        pageBuilder: (ctx, animation1,animation2){
          return FadeTransition(
            opacity: animation1,
            child: CFImageDetailPage(imageUrl),
          );
        }),
    );
  }

}