import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ripples_code_getx/next_screen_named.dart';
import 'package:ripples_code_getx/next_screen_unamed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  var count = Rx<int>(0);
  //var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => GetMaterialApp(
        initialRoute: "/",
        transitionDuration: const Duration(milliseconds: 750),
        defaultTransition: Transition.leftToRight,
        getPages: [
          GetPage(name: "/", page: () => MyApp()),
          GetPage(
            //name: "/next_screen/:id",
            name: "/next_screen",
            page: () => const NextScreenNamed(),
            transitionDuration: const Duration(milliseconds: 1000),
            transition: Transition.leftToRight,
            curve: Curves.easeInOut,
          ),
        ],
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: Center(
              child: ElevatedButton(
                  child: const Text("Goto Next From Home Screen"),
                  onPressed: () {
                    // showSnackBar();
                    // showDialog();
                    // showBottomsheet();
                    // nextScreenUnamed();
                    nextScreenNamed();
                  }),
            ),
          ),
        ),
      ),
    );
  }

  increment() {
    count.value++;
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
  Get.bottomSheet(
    Container(
      child: Wrap(
        children: [
          ListTile(
            leading: Icon(Icons.wb_sunny_outlined),
            title: Text("Light Theme"),
            onTap: () {
              Get.changeTheme(ThemeData.light());
              Get.back();
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text("Dark Theme"),
            onTap: () {
              Get.changeTheme(ThemeData.dark());
              Get.back();
            },
          )
        ],
      ),
    ),
    backgroundColor: Colors.green.shade50,
    elevation: 2,
    // isDismissible: false,
    // enableDrag: false,
    // isScrollControlled: true,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(12),
    ),
    // clipBehavior: Clip.none,
    enterBottomSheetDuration: Duration(seconds: 1),
  );
}

//Navigation unamed routes
nextScreenUnamed() async {
  var obj = await Get.to(
    const NextScreenUnamed(),
    transition: Transition.zoom,
    curve: Curves.easeInOut,
    duration: const Duration(milliseconds: 650),
    fullscreenDialog: true,
    arguments: "Dynamic send in arguments from Home Screen",
  );
  print(obj);
}

nextScreenNamed() {
  Get.toNamed(
    /*"/next_screen/123456" */
    "/next_screen?param1='11111'&param2='222222'",
    arguments:
        "some arguments passed to next screen", /*parameters: {'id': "125", "name": "nebhi"}*/
  );
}
