import 'package:flutter/material.dart';
import 'package:rmi/views/home.dart';
import 'package:rmi/views/covid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ruang Muda Indramayu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Covid(),
    );
  }
}
