import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_detection_task/views/task_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Palm Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PalmScannerPage(),
    );
  }
}
