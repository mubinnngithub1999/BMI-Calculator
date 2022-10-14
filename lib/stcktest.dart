import 'package:bmi_calculator/components/my_upbar.dart';
import 'package:flutter/material.dart';

class StackTest extends StatefulWidget {
  const StackTest({super.key});

  @override
  State<StackTest> createState() => _StackTestState();
}

class _StackTestState extends State<StackTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: myOwnAppBar('test'),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 200,
                height: 200,
                color: Colors.amber,
              ),
            ),
            Positioned(
              top: 10,
              bottom: 10,
              child: Container(
                width: 180,
                height: 180,
                color: Colors.red,
              ),
            ),
            Positioned(
              right: 5,
              left: 5,
              child: Container(
                width: 160,
                height: 160,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
