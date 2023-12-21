import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/app/presentation/logic/app_cubit.dart';
import 'package:space_x/common/app_colors.dart';
import 'package:space_x/common/app_config/app_config.dart';
import 'package:space_x/services/navigation/app_router.dart';
import 'package:space_x/services/navigation/helpers/app_navigator_observer.dart';

class App extends StatefulWidget {
  App() : super(key: globalKey);
  static final globalKey = GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppStatus>(
      listener: (context, status) async {
        switch (status) {
          case AppStatus.splash:
          case AppStatus.authorized:
            break;
          case AppStatus.unAuthorized:
            _router.replaceAll([const RocketsListRoute()]);
        }
      },
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.shared.black,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateTitle: (_) => AppConfig.appName,
        localizationsDelegates: [
          ...context.localizationDelegates,
          DefaultCupertinoLocalizations.delegate,
        ],
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routeInformationParser: _router.defaultRouteParser(),
        routerDelegate: _router.delegate(
          navigatorObservers: () => [
            AutoRouteObserver(),
            AppNavigatorObserver(),
          ],
        ),
        builder: (_, child) => child ?? const SizedBox(),
      ),
    );
  }
}
