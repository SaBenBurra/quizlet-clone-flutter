import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/utils/screen_size.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    super.key,
    required this.screenSize,
    required this.tabId,
  });

  final ScreenSize screenSize;
  final int tabId;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        color: Colors.white,
        iconSize: screenSize.height * .05,
        onPressed: () => Get.back(id: tabId),
        icon: Icon(Icons.arrow_back_outlined));
  }
}
