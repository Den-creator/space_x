import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_x/app/presentation/logic/app_cubit.dart';
import 'package:space_x/app/presentation/screens/app.dart';
import 'package:space_x/common/app_config/app_config.dart';
import 'package:space_x/common/app_config/env_type.dart';
import 'package:space_x/common/constants.dart';
import 'package:space_x/features/rockets/data/datasources/rockets_data_source.dart';
import 'package:space_x/features/rockets/domain/repositories/rockets_repository.dart';
import 'package:space_x/generated/codegen_loader.g.dart';

Future<void> main() async {
  await AppConfig.load(EnvType.dev);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));

  runApp(EasyLocalization(
    path: 'assets/locale',
    assetLoader: const CodegenLoader(),
    supportedLocales: const [C.usLocale],
    startLocale: C.usLocale,
    fallbackLocale: C.usLocale,
    child: ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => RepositoryProvider(
        create: (_) => RocketsRepository(RocketsDataSource()),
        child: BlocProvider(
          create: (_) => AppCubit(),
          child: App(),
        ),
      ),
    ),
  ));
}
