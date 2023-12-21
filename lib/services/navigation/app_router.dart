import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:space_x/app/presentation/screens/splash_screen.dart';
import 'package:space_x/features/rockets/presentation/screens/rocket_details_screen.dart';
import 'package:space_x/features/rockets/presentation/screens/rockets_list_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: RocketsListRoute.page),
    AutoRoute(page: RocketDetailsRoute.page),
  ];
}
