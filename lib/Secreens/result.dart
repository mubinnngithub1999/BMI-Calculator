import 'package:bmi_calculator/components/my_upbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'gender.dart';

class Result extends StatefulWidget {
  final String image;
  final Color colorGendr;
  final double bmi;
  final String weightRange;
  final Color warning;
  final bool happy;
  const Result(
      {super.key,
      required this.image,
      required this.colorGendr,
      required this.bmi,
      required this.weightRange,
      required this.warning,
      required this.happy});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myOwnAppBar('Your BMI result'),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          // alignment: Alignment.center,
          children: [
            Positioned(
              top: 211,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  color: Colors.pink.withOpacity(0.1),
                  width: 180,
                  height: 170,
                ),
              ),
            ),
            Positioned(
              top: 195,
              child: SizedBox(
                width: 100,
                height: 160,
                child: AspectRatio(
                  aspectRatio: 10 / 8,
                  child: SvgPicture.asset(
                    widget.image,
                    fit: BoxFit.fitWidth,
                    alignment: FractionalOffset.topCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 55,
              child: SizedBox(
                width: 300,
                height: 300,
                child: Visibility(
                    visible: widget.happy,
                    child: Image.asset('images/Group47.png')),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 458,
                child: Column(
                  children: [
                    Container(
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black26)),
                      child: Center(
                        child: Text(widget.weightRange,
                            style: TextStyle(
                                color: widget.warning,
                                fontWeight: FontWeight.bold,
                                fontSize: 11)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(
                        "your BMI is ${widget.bmi}",
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 11),
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScreenGender())),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Container(
                          width: 60,
                          height: 60,
                          color: widget.colorGendr,
                          child: const Icon(
                            CupertinoIcons.restart,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
