import 'package:flutter/material.dart';

import 'internationalization/main_internazionalization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return //SnackBar_defaultDialog_Bottomsheet_Routes();
        // Main_Getx();
        Main_Internazionalization();
  }
}
