// ignore_for_file: sized_box_for_whitespace

import 'package:bmi_calculator/Secreens/height_weight.dart';
import 'package:bmi_calculator/components/my_upbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenGender extends StatefulWidget {
  const ScreenGender({Key? key}) : super(key: key);

  @override
  State<ScreenGender> createState() => _ScreenGenderState();
}

class _ScreenGenderState extends State<ScreenGender> {
  bool selector = true;
  String color = '0xffffff';
  String image = '';
  late Color colorGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myOwnAppBar('Choose Gender'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: selector ? 1 : 0.2,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selector = true;
                    });
                  },
                  child: Container(
                    // color: Colors.indigoAccent,
                    height: 350,
                    width: 200,
                    child: SvgPicture.asset('images/female.svg'),
                  ),
                ),
              ),
              Opacity(
                opacity: !selector ? 1 : 0.5,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selector = false;
                    });
                  },
                  child: Container(
                    // color: Colors.redAccent,
                    height: 350,
                    width: 200,
                    child: SvgPicture.asset('images/male.svg'),
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              if (selector == true) {
                image = 'images/female.svg';
                colorGender = Colors.pink;
              } else {
                image = 'images/male.svg';
                colorGender = Colors.blue;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HeightAndWeight(
                          text:image,
                          color: colorGender)));
            },
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: selector ? Colors.pink : Colors.blue,
              ),
              child: const Icon(
                CupertinoIcons.arrow_right,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
