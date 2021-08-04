import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ripples_code_getx/main_getx/my_controller.dart';
import 'package:ripples_code_getx/main_getx/student.dart';

class Main_Getx extends StatelessWidget {
  //reactive state management
  var count = 0.obs;
  //var student = Student(name: "Nebhi", subname: "Mourad").obs;
  var upperCase = false;

  MyConttroller myConttroller = Get.put(MyConttroller());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => SafeArea(
            child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Obx(() => Text("$count")),
                /*GetX<MyConttroller>(
                  //init: MyConttroller(),
                  builder: (controller) =>
                      Text("${controller.student.value.name}"),
                ),*/
                /*GetX<MyConttroller>(
                    builder: (controller) => Text(
                        "${controller.student.name} and count value is: ${controller.count.value}")),*/
                GetBuilder<MyConttroller>(
                    builder: (controller) =>
                        Text("${controller.student.name} ")),
                /*GetBuilder<MyConttroller>(
                    id: 'second_getbuilder',
                    builder: (controller) =>
                        Text("${controller.student.name}")),*/
                ElevatedButton(
                  onPressed: () {
                    //increment();
                    if (!upperCase)
                      /*student.update((st) {
                        st?.name = st.name.toString().toUpperCase();
                      });*/
                      Get.find<MyConttroller>().toUpperCase();
                    else
                      /*student.update((st) {
                        st?.name = st.name.toString().toLowerCase();
                      });*/
                      Get.find<MyConttroller>().toLowerCase();
                    upperCase = !upperCase;
                  },
                  child: //const Text("Increment"),
                      const Text("To Upper Case"),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  void increment() {
    count++;
  }
}
