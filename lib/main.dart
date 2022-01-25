import 'package:flutter/material.dart';
import 'package:flutter_practice/food_order/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My First App',
      home: HomeOrderPage(),
    );
  }
}
