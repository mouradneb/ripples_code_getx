import 'package:flutter/material.dart';
import 'package:ripples_code_getx/main_getx/main_getx.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return //SnackBar_defaultDialog_Bottomsheet_Routes();
        Main_Getx();
  }
}
