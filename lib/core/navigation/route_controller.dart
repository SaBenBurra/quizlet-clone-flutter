import 'package:get/get.dart';
import 'package:quizlet_app/core/navigation/core_navigator.dart';

class RouteController extends GetxController {
  List<CoreNavigator> navigators;
  var navigatorIndex = 0.obs;

  RouteController({required this.navigators});

  void setNavigatorIndex(int index) {
    navigatorIndex.value = index;
  }
}
