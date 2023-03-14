import 'dart:async';
import 'package:animal/res/global.dart';
import 'package:animal/views/screens/detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'detail': (context) => const Detail(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Global.value = Global.random.nextInt(5);

    Timer(
      const Duration(seconds: 2),
        () => Navigator.pushNamed(context, 'detail'),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Image.asset(Global.animalList.elementAt(Global.value),fit: BoxFit.fill),
      ),
    );
  }
}
