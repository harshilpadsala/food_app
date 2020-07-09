import 'package:flutter/material.dart';
import 'screens/detail_page.dart';
import 'screens/home_page.dart';

void main() => runApp(FoodApp());

class FoodApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
