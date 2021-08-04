import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreenNamed extends StatelessWidget {
  const NextScreenNamed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Next Screen Named"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Back to Home Screen"),
            ),
            Get.parameters.isNotEmpty
                ? Text("${Get.parameters}")
                : const SizedBox.shrink(),
            Get.arguments != null
                ? Text("${Get.arguments}")
                : const SizedBox.shrink(),
          ],
        ),
      ),
    ));
  }
}
