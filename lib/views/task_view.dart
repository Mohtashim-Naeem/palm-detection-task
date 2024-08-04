import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palm_detection_task/controllers/task_controller.dart';

class PalmScannerPage extends StatelessWidget {
  final PalmScannerController controller = Get.put(PalmScannerController());

  PalmScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Palm Reading'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.pinkAccent.withOpacity(0.2),
              ),
              width: Get.width * 0.8,
              height: Get.height * 0.4,
              child: Obx(() {
                if (controller.pickedImage.isNotEmpty) {
                  return Image.file(
                    fit: BoxFit.contain,
                    File(controller.pickedImage.value),
                  );
                } else {
                  return const Text('No image selected.');
                }
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.pickImage,
              child: const Text('Capture Image'),
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isPalmDetected.value) {
                return const Text('Palm is detected.');
              } else {
                return const Text(
                  'No Palm is detected in the uploaded image, please try again*.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
