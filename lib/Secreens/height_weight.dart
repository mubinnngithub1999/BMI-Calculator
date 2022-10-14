// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:bmi_calculator/Secreens/result.dart';
import 'package:bmi_calculator/components/my_upbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeightAndWeight extends StatefulWidget {
  final String text;
  final Color color;
  const HeightAndWeight({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  State<HeightAndWeight> createState() => _HeightAndWeightState();
}

class _HeightAndWeightState extends State<HeightAndWeight> {
  double height = 100;
  double weight = 30;
  double bmi = 0;
  String weightRange = '';
  late bool happy;
  late Color warning;

  // late String text;

  @override
  Widget build(BuildContext context) {
    // print(text);

    return Scaffold(
      appBar: myOwnAppBar('Screen Height & Weight'),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RotatedBox(
                          quarterTurns: -1,
                          child: Container(
                            width: 400,
                            child: Slider(
                                value: weight,
                                min: 30,
                                max: 120,
                                activeColor: widget.color,
                                inactiveColor: Colors.black26,
                                onChanged: (value) {
                                  setState(() {
                                    weight = value;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    // Expanded(child: Container(color: Colors.orange,)),
                    SvgPicture.asset(widget.text),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RotatedBox(
                          quarterTurns: -1,
                          child: Container(
                            width: 400,
                            child: Slider(
                                value: height,
                                min: 100,
                                max: 200,
                                activeColor: widget.color,
                                inactiveColor: Colors.black26,
                                onChanged: (value) {
                                  setState(() {
                                    height = value;
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                        color: (widget.color).withOpacity(0.2),
                        child: Row(
                          children: [
                            Icon(Icons.fitness_center, color: widget.color),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Weight : ${weight.round()}',
                              style:
                                  TextStyle(color: widget.color, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: 160,
                        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                        color: (widget.color).withOpacity(0.2),
                        child: Row(
                          children: [
                            Icon(Icons.height, color: widget.color),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Height : ${height.round()}',
                              style: TextStyle(
                                color: widget.color,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        try {
                          bmi = double.parse(((weight.round() /
                                  (pow((height.round() / 100), 2))))
                              .toStringAsFixed(1));
                        } catch (e) {
                          bmi = 0;
                        }

                        warning = Colors.red;
                        happy = false;
                        if (bmi < 18.5) {
                          warning = const Color.fromARGB(255, 194, 194, 10);
                          weightRange = 'underweight range';
                        } else if (bmi >= 18.5 && bmi < 25) {
                          happy = true;
                          warning = Colors.green;
                          weightRange = 'healthy weight range';
                        } else if (bmi >= 25 && bmi < 30) {
                          weightRange = 'overweight range';
                        } else if (bmi >= 30) {
                          weightRange = 'obesity range';
                        }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Result(
                                    image: widget.text,
                                    colorGendr: widget.color,
                                    bmi: bmi,
                                    weightRange: weightRange,
                                    warning: warning,
                                    happy: happy)));
                      });
                    },
                    child: Container(
                      width: 250,
                      height: 55,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: (widget.color),
                      ),
                      child: const Center(
                        child: Text(
                          'Result',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Text(height.toStringAsFixed(0)),
            ],
          ),
        ),
      ),
    );
  }
}
