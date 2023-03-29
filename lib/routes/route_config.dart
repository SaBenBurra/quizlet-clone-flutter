import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizlet_app/core/navigation/core_navigator.dart';
import 'package:quizlet_app/routes/pages/cardset_detail_page.dart';
import 'package:quizlet_app/routes/pages/cardset_list_page.dart';

enum RouteTab { home, search }

extension GetIndex on RouteTab {
  int get index {
    switch (this) {
      case RouteTab.home:
        return 0;
      case RouteTab.search:
        return 1;
    }
  }
}

class RouteConfig {
  static List<CoreNavigator> navigators = [
    CoreNavigator(
        key: Get.nestedKey(0),
        routes: <String, GetPageRoute>{
          "/": GetPageRoute(page: () => CardsetListPage()),
          // "/cardset-detail": GetPageRoute(page: () => CardsetDetailPage(tabId: 0))
        },
        initialRoute: "/",
        notFoundScreen: Scaffold(body: Center(child: Text("not found"))))
  ];
  static Map<String, int> tabIds = {"HOME": 0, "SEARCH": 1};
}
