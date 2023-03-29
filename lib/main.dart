import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Bindings;
import 'package:quizlet_app/app/bindings.dart';
import 'package:quizlet_app/core/navigation/root.dart';
import 'package:quizlet_app/routes/route_config.dart';
import 'package:quizlet_app/widgets/bottom_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Bindings.bindAll();
    return GetMaterialApp(
        title: 'Flutter Demoasdf',
        // initialRoute: RoutingConfig.initialRoute,
        // getPages: RoutingConfig.pages,
        home: Root(
          navigators: RouteConfig.navigators,
          bottomBar: buildBottomNavigationBar(),
        ),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ));
  }

}
