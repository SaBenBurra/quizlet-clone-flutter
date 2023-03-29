import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core_navigator.dart';
import 'route_controller.dart';

class Root extends StatelessWidget {
  Root({super.key, this.bottomBar, required this.navigators});

  Widget? bottomBar;
  List<CoreNavigator> navigators;

  @override
  Widget build(BuildContext context) {
    final RouteController routeController = RouteController(navigators: navigators);
    Get.put(routeController);
    return Scaffold(
        body: Obx(() => IndexedStack(
            index: routeController.navigatorIndex.value,
            children: routeController.navigators)),
        bottomNavigationBar: bottomBar);
  }
}
