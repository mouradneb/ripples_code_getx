import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextScreenUnamed extends StatelessWidget {
  const NextScreenUnamed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Next Screen Unamed"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Next Screen Unamed"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.back(
                  result: "Object returned from next screen",
                );
              },
              child: const Text("Back to Home Screen"),
            ),
            Get.arguments != null
                ? Text("${Get.arguments}")
                : const SizedBox.shrink()
          ],
        ),
      ),
    ));
  }
}
