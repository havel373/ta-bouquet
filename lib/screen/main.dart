import 'package:ta/screen/sign_up.dart';
import 'package:ta/screen/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:ta/screen/startpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const startpage(),
    );
  }
}
