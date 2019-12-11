import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:rust_use_test_plugin/rust_use_test_plugin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _word;

  @override
  void initState() {
    super.initState();
    RustUseTestPlugin rustUseTestPlugin = new RustUseTestPlugin();
    _word = rustUseTestPlugin.helloWorld("Yoohoo");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_word\n'),
        ),
      ),
    );
  }
}
