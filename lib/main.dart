import 'package:flutter/material.dart';
import 'package:custom_painter_flutter/src/pages/animations_page.dart';
import 'package:custom_painter_flutter/src/pages/headers_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: AnimationsPage(),
    );
  }
}
