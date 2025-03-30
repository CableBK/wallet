import 'package:flutter/material.dart';
import 'package:wallet/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'wallet', home: App());
  }
}
