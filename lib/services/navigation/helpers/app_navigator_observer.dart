import 'package:flutter/material.dart';
import 'package:space_x/common/utils/utils.dart';

class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Utils.debugPrint(route.settings.name);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    Utils.debugPrint(route.settings.name);
  }
}
