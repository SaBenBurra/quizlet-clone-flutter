import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/utils/screen_size.dart';

ElevatedButton buildCustomButton1(
    {required String text,
    required void Function() onPressed,
    Color? backgroundColor,
    double? width,
    double? height,
    TextStyle? textStyle}) {
  ScreenSize screenSize = Get.find();
  return ElevatedButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: textStyle,
    ),
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(
            width ?? screenSize.width * .4, height ?? screenSize.height * .07)),
        backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? ColorConstants.darkSixthAppColor)),
  );
}
