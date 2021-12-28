import 'package:flutter/material.dart';

class CFImageDetailPage extends StatelessWidget {

  final String imageUrl;

  const CFImageDetailPage(this.imageUrl,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: imageUrl,
            child: Image.network(imageUrl, fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}

