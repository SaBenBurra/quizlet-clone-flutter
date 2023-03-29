import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CoreNavigator extends Navigator {
  Navigator? navigator;
  Map<String, GetPageRoute> routes;
  Widget notFoundScreen;

  CoreNavigator(
      {required super.key,
      required this.routes,
      required String initialRoute,
      required this.notFoundScreen});

  @override
  RouteFactory? get onGenerateRoute => (RouteSettings settings) {
        for (String routeName in routes.keys) {
          if (settings.name == routeName) {
            return routes[routeName];
          }
        }
        return GetPageRoute(page: () => notFoundScreen);
      };
}
