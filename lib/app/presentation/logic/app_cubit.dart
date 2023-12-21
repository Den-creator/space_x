import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_x/services/token_manager.dart';

enum AppStatus { splash, unAuthorized, authorized }

class AppCubit extends Cubit<AppStatus> {
  AppCubit() : super(AppStatus.splash) {
    _setup();
  }

  // final IAuthRepository repository;

  Future<void> _setup() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    await EasyLocalization.ensureInitialized();

    /// Make delay for Splash Screen presentation
    await Future.delayed(const Duration(seconds: 1));

    // if (await TokenManager.isUserAuthenticated) {
    //   final result = await repository.loadUserAndOther();
    //   if (result.isRight) {
    //     emit(const AppState(status: AppStatus.authorized));
    //     return;
    //   }
    // }

    emit(AppStatus.unAuthorized);
  }

  // void emitAuthorizedState() {
  //   return emit(const AppState(status: AppStatus.authorized));
  // }

  Future<void> logOut({bool withAPI = true}) async {
    emit(AppStatus.unAuthorized);

    // if (withAPI) await repository.logout();
    await TokenManager.removeTokenData();
  }
}
