

import 'package:bmi_calculator/style/colors.dart';
import 'package:bmi_calculator/style/text_size.dart';
import 'package:bmi_calculator/style/text_style.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  String? result;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: TypeColors.black),
        ),
        backgroundColor: TypeColors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: TypeColors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Man", TypeColors.black, 0),
                  radioButton("Woman", TypeColors.pink, 1),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Hight in Cm :",
                style: TextStyles.normal,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your height in Cm",
                  filled: true,
                  fillColor: TypeColors.backgroundColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Weight in Kg :",
                style: TextStyles.normal,
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Your Weight in Kg",
                  filled: true,
                  fillColor: TypeColors.backgroundColor,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  double height = double.parse(heightController.value.text);
                  double weight = double.parse(weightController.value.text);
                  calculateBmi(height, weight);
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: TypeColors.amber),
                  child: const Text(
                    "Calculate",
                    style: TextStyles.textButton,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: TypeColors.backgroundColor,
                ),
                width: double.infinity,
                child: const Text(
                  "Your BMI is :",
                  style: TextStyles.bigText,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: TypeColors.backgroundColor,
                ),
                height: 150,
                width: double.infinity,
                child: Text(
                  "$result",
                  // textAlign: TextAlign.center,
                  style: TextStyles.superText,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: InkWell(
          onTap: () {
            changeIndex(index);
          },
          child: Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: currentindex == index ? color : TypeColors.backgroundColor,
            ),
            child: Text(
              value,
              style: TextStyle(
                  color: currentindex == index ? TypeColors.white : color,
                  fontSize: TextSize.tSize18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
