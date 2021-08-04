import 'package:get/get.dart';

import 'student.dart';

class MyConttroller extends GetxController {
  // var student = Student(name: "Nebhi", subname: "Mourad").obs;
  var student = Student(name: "Nebhi", subname: "Mourad");
  var count = 0.obs;

  toUpperCase() {
    //student.name.value = student.name.value.toUpperCase();
    /*student.update((st) {
      st?.name = st.name.toString().toUpperCase();
    });*/
    student.name = student.name.toString().toUpperCase();
    // update(['second_getbuilder']);
    update();
  }

  toLowerCase() {
    //student.name.value = student.name.value.toLowerCase();
    /*student.update((st) {
      st?.name = st.name.toString().toLowerCase();
    });*/
    student.name = student.name.toString().toLowerCase();
    //update(['second_getbuilder']);
    update();
  }

  @override
  void onInit() async {
    once(count,
        (callback) => {print("once count is modified, new value is : $count")});
    Future.delayed(const Duration(seconds: 5)).then((value) => count++);
    debounce(count,
        (callback) => {print("ever count is modified, new value is : $count")});
    ever(count, (callback) => {});
    everAll([count], (callback) => {});
    interval(count, (callback) => count++, time: const Duration(seconds: 3));
  }
}
