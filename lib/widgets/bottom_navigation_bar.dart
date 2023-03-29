import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/app/constants/color_constants.dart';
import 'package:quizlet_app/core/navigation/route_controller.dart';

BottomNavigationBar buildBottomNavigationBar() {
  return BottomNavigationBar(
      onTap: (currentIndex) {
        RouteController routeController = Get.find();
        routeController.setNavigatorIndex(currentIndex);
      },
      enableFeedback: false,
      backgroundColor: ColorConstants.darkBackgroundColor,
      fixedColor: ColorConstants.darkFourthAppColor,
      unselectedItemColor: ColorConstants.darkFifthAppColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "ssdf"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
      ]);
}
