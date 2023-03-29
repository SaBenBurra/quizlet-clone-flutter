import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart' hide Card;
import 'package:get/get.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/app/data/models/card.dart';
import 'package:quizlet_app/utils/screen_size.dart';

class CustomFlipCard extends StatelessWidget {
  CustomFlipCard({super.key, required this.card});

  final Card card;
  final ScreenSize screenSize = Get.find();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      speed: 300,
      front: buildCard(card.definition),
      back: buildCard(card.term),
    );
  }

  Container buildCard(String text) {
    return Container(
      padding: EdgeInsets.all(screenSize.width * .03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: ColorConstants.darkSixthAppColor,
      ),
      width: screenSize.width * .85,
      height: screenSize.height * .3,
      child: Center(
          child: AutoSizeText(
        text,
        style: TextStyle(color: Colors.white, fontSize: screenSize.width * .06),
        minFontSize: (screenSize.width * .02).round().toDouble(),
      )),
    );
  }
}
