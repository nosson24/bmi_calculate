

import 'package:bmi_calculator/style/colors.dart';
import 'package:bmi_calculator/style/text_size.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const normal = TextStyle(
    color: TypeColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize18,
  );

  static const choiceText = TextStyle(
    // color: TypeColors.black,
    // fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize18,
  );

  static const textButton = TextStyle(
    color: TypeColors.white,
    fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize16,
  );

  static const bigText = TextStyle(
    color: TypeColors.black,
    fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize24,
  );

  static const superText = TextStyle(
    color: TypeColors.black,
    fontWeight: FontWeight.bold,
    fontSize: TextSize.tSize40,
  );
}
