// ignore_for_file: camel_case_types

import 'package:bmi_calculator/Secreens/result.dart';
import 'package:bmi_calculator/stcktest.dart';
import 'package:flutter/material.dart';

import 'Secreens/gender.dart';

void main() {
  runApp(const mainApp());
}


class mainApp extends StatefulWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
debugShowCheckedModeBanner: false,
      home: ScreenGender(),
    );
  }
}
