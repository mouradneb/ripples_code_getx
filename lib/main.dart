import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Center(
              child: ElevatedButton(
                  child: const Text("Show Bottomsheet"),
                  onPressed: () {
                    // showSnackBar();
                    // showDialog();
                  }),
            ),
          ),
        ),
      ),
    );
  }
}

//snackbar
showSnackBar() => Get.snackbar(
      "Default Title", "Default Message",
      titleText: Row(
        children: [
          const Icon(
            Icons.info,
            color: Colors.green,
          ),
          SizedBox(width: 5.w),
          const Expanded(
            child: Text("Custom titleText"),
          )
        ],
      ),
      messageText: Container(
        margin: EdgeInsets.only(top: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            SizedBox(width: 14.w),
            const Text("Custom messageText")
          ],
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      animationDuration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.bounceInOut,
      reverseAnimationCurve: Curves.bounceInOut,
      backgroundGradient:
          const LinearGradient(colors: [Colors.green, Colors.red]),
      borderColor: Colors.black,
      borderWidth: 1.sp,
      borderRadius: 8.r,
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      boxShadows: [
        const BoxShadow(
          blurRadius: 16,
          spreadRadius: 8,
          color: Colors.grey,
          offset: Offset(10, -10),
        )
      ],
      icon: const Icon(Icons.info_outline_rounded),
      mainButton: TextButton(
        onPressed: () {},
        child: Text("Add"),
        style: TextButton.styleFrom(
            primary: Colors.white, backgroundColor: Colors.green),
      ),
      snackStyle: SnackStyle.FLOATING,
      //backgroundColor: Colors.green.shade100,
      overlayBlur: 0.9,
      //overlayColor: Colors.grey.shade100,
    );

// Dialog
//showDialog() => Get.defaultDialog();
showDialog() => Get.defaultDialog(
      title: "Default Title",
      titleStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      middleText: "Default Middle Text",
      middleTextStyle: const TextStyle(color: Colors.blue, fontSize: 16),
      backgroundColor: Colors.grey[100],
      content: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text("Custom content"),
          SizedBox(height: 5.h),
          Text("Ok"),
        ],
      ),
      barrierDismissible: false,
      textCancel: "Cancel",
      textConfirm: "Confirm",
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.back();
      },
      radius: 30,
      buttonColor: Colors.green,
      cancel: ElevatedButton(
        onPressed: () {},
        child: Text("Cancel"),
      ),
      confirm: ElevatedButton(
        onPressed: () {},
        child: Text("Confirm"),
      ),
    );

// bottomsheet
showBottomsheet() {
  Get.bottomSheet(Container());
}
